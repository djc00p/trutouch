# frozen_string_literal: true

module AddressConfirmation
  def confirm_address(address)
    address_results = geocode_search_results(address)
    address_confidence_level = confirm_confidence_level(address_results, address)

    confirmed_address?(address_results, address_confidence_level)
  end

  private

  def confirmed_address?(results, confidence_level)
    case confidence_level[:validation]
    when "NOT_CONFIRMED"
      confidence_level
    when "PARTIALLY_CONFIRMED"
      partially_confirmed_address(results[confidence_level.delete(:index)], confidence_level)
    when "CONFIRMED"
      confirmed_address(results[0], confidence_level)
    end
  end

  def confirmed_address(address, confidence_level)
    confirmation_update(address, confidence_level)

    confidence_level
  end

  def partially_confirmed_address(address, confidence_level)
    confirmed_address(address, confidence_level)
  end

  def confirmation_update(address, confidence_level)
    if address.key?(:name)
      update_address_line2(address, confidence_level)
    else
      update(address_line1: address[:housenumber].concat(" ", address[:street]),
             city: address[:city], state: address[:state_code], zip_code: address[:postcode],
             validation: confidence_level[:validation].titleize)
    end
  end

  def update_address_line2(address, confidence_level)
    update(address_line1: address[:name], address_line2: address[:housenumber].concat(" ", address[:street]),
           city: address[:city], state: address[:state_code], zip_code: address[:postcode],
           validation: confidence_level[:validation].titleize)
  end

  def confirm_confidence_level(results, submitted_address)
    accept_level = 0.95

    validation_result = {}

    if results.length.zero?
      validation_result[:validation] = "NOT_CONFIRMED"
      return validation_result
    end

    address = results[0]

    if address[:rank][:confidence] >= accept_level
      validation_result[:validation] = "CONFIRMED"
    else
      paresed_results = parse_search_results(submitted_address, results, accept_level)
      validation_result.merge!(paresed_results)
    end

    validation_result
  end

  def parse_search_results(address, results, accept_level, validation_result = {})
    results.each_with_index do |result, index|
      next unless !validation_result.key?(:validation) && address_attributes_included?(result, address)

      validation_result[:index] = index
      validation_result[:validation] = "PARTIALLY_CONFIRMED"
      validation_result[:validation_details] = validation_details(result, accept_level)
    end

    validation_result[:validation] = "NOT_CONFIRMED" unless validation_result.key?(:validation)

    validation_result
  end

  def address_attributes_included?(result, address)
    address = address.strip.titleize

    (result.key?(:housenumber) && result[:housenumber] == address.to_i.to_s) &&
      (address.include?(result[:city]) || address.include?(result[:state]) ||
       address.include?(result[:state_code]) || address.include?(result[:postcode]))
  end

  def validation_details(address, accept_level)
    if address[:rank].key?(:confidence_street_level) && address[:rank][:confidence_street_level] >= accept_level
      "BUILDING_NOT_FOUND"
    elsif address[:rank][:confidence_city_level] >= accept_level
      "STREET_LEVEL_DOUBTS"
    else
      "CITY_LEVEL_DOUBTS"
    end
  end
end
