# frozen_string_literal: true

class AddressesController < ApplicationController
  def new
    @address = @user.addresses.build
  end

  def create
    address_results = address_search(params[:address_line1])
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

  def address_search(address)
    
  end
end
