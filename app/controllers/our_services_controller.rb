# frozen_string_literal: true

class OurServicesController < ApplicationController
  def index
    @detail_service = DetailService
    @main_detail_services = DetailService.main_detail_services
    @deluxe_detail_services = DetailService.deluxe_detail_services
    @additional_detail_services = DetailService.additional_detail_services
    @tint_services = TintService.all
    @clear_bra_services = ClearBraService.all
  end
end
