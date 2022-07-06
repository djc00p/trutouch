# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :find_user, only: %i[new create]

  def new
    @address = @user.addresses.build
  end

  def create
    address_results = address_search
    address = @user.addresses.build(address_results)
    if address.save
      flash[:success] = "Your address has been add!"
      redirect_to profile_url(@user)
    else
      flash[:danger] = "Please check the provided address is correct."
      render :new, status: :temporary_redirect
    end
  end

  def destroy; end

  private

  def address_params
    params.require(:address).permit(:address_line1, :city, :state, :zip_code)
  end

  def find_user
    @user = User.find(params[:profile_id])
  end

  def address_search
    search_results = Address.search_results(address_params.values.join(", "))

    address_validation(search_results)
  end
end
