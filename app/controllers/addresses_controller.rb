# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :find_user, only: %i[new create]
  before_action :set_address, only: %i[destroy]

  def new
    @address = @user.addresses.build
  end

  def create
    address = @user.addresses.build
    address_search(address)

    if address.save
      flash[:success] = "Your address has been add!"
      redirect_to profile_url(@user)
    else
      flash[:danger] =
        "#{address_params.values.join(', ')} could not be found or is outside of our pickup/dropoff radius.
        Please check the  provided address is correct."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy; end

  private

  def find_user
    @user = User.includes(:addresses).find(params[:profile_id])
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:address_line1, :city, :state, :zip_code)
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
      flash[:success] = "Your address has been confirmed!"
    end
  end
end
