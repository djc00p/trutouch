# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def new
    @appointment = @customer.appointments.build
  end
end
