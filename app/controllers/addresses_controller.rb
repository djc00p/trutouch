# frozen_string_literal: true

class AddressesController < ApplicationController
  def new
    @address = @user.addresses.build
  end

  def create; end

  def destroy; end
end
