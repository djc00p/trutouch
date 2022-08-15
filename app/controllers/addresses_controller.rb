# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :authorized
  before_action :set_address, only: %i[destroy confirm]

  def new
    @address = current_user.addresses.build
  end

  def create
    @address = current_user.addresses.build
    address_search(@address)

    if @address.save
      flash[:success] = "Your address has been add!"
      redirect_to profile_url(current_user)
    else
      flash[:danger] =
        "#{address_params.values.join(', ')} could not be found or is outside of our pickup/dropoff radius.
        Please check the provided address is correct."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(@address.addressable_id)
    @address.destroy
    flash[:success] = "Your address has been deleted!"
    redirect_to profile_url(@user)
  end

  def confirm
    @address.update(validation: "confirmed")
    flash[:success] = "Your address has been confirmed!"
    redirect_to profile_url(@address.addressable_id)
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    if params.key?("structured-form") && params["structured-form"] == "on"
      params.require(:address).permit(:housenumber, :street, :city, :state, :zip_code)
    else
      params.require(:address).permit(:address_line1)
    end
  end

  def address_search(address)
    search_results = address.search_results(address_params.values.join(", "))

    address_validation(search_results)
  end

  def address_validation(results)
    case results[:validation]
    when "PARTIALLY_CONFIRMED"
      flash[:warning] =
        "Your address has been partially confirmed. Potential cause is
      \"#{results.delete(:validation_details).titleize}\". Please confirm the found address is correct."
    when "CONFIRMED"
      flash[:info] = "Your address has been confirmed!"
    end
  end
end
