# frozen_string_literal: true

require "rails_helper"

module AppointmentHelpers
  def fill_in_address_single_line_form(address)
    fill_in "address[address_line1]", with: address
  end

  def fill_in_address_structured_form(address)
    check "structured-form"

    fill_in "address[housenumber]", with: address[:housenumber]
    fill_in "address[street]", with: address[:street]
    fill_in "address[city]", with: address[:city]
    fill_in "address[state]", with: address[:state]
    fill_in "address[zip_code]", with: address[:zip_code]
  end

  def select_appointment_form_info(appointment)
    select appointment[:scheduled_for], from: "appointment[scheduled_for]"
    select appointment[:service_type], from: "appointment[service_type]"
    select appointment[:service], from: "appointment[service]"

    return unless appointment.key?("additional_services")

    click_on "Additional Services"

    select_additional_appointment_services(appointment)
  end

  def select_additional_appointment_services(appointment)
    count = appointment[:additional_services].length
    appointment[:additional_services].each_with_index do |service, index|
      select service[:service_type], from: "appointment[service_type]"
      select service[:service], from: "appointment[service]"

      click_on "Add Service" unless index == (count - 1)
    end
  end

  def fill_in_customer_form(customer)
    fill_in "customer[first_name]", with: customer[:first_name]
    fill_in "customer[last_name]", with: customer[:last_name]
    fill_in "customer[email]", with: customer[:email]
    fill_in "customer[phone_number]", with: customer[:phone_number]
  end

  def fill_in_user_form(user)
    fill_in "user[first_name]", with: user[:first_name]
    fill_in "user[last_name]", with: user[:last_name]
    fill_in "user[email]", with: user[:email]
    fill_in "user[phone_number]", with: user[:phone_number]
    fill_in "user[password]", with: user[:password]
    fill_in "user[confirm_password]", with: user[:password]
    check "email"
  end

  def select_vehicle_from_form(production_vehicle)
    select production_vehicle[:year], from: "vehicle[year]"
    select production_vehicle[:color], from: "vehicle[color]"
    select production_vehicle[:make], from: "vehicle[make]"
    select production_vehicle[:model], from: "vehicle[model]"
  end

  def pickup_drop_off(appointment)
    case appointment[:pickup_drop_off]
    when "no"
      check "no"
    when "pickup"
      check "pickup-only"
    when "drop off"
      check "drop-off-only"
    when "pickup and drop off"
      check "pickup-and-drop-off"
    end
  end
end
