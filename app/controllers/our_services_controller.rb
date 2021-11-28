# frozen_string_literal: true

class OurServicesController < ApplicationController
  def index
    @ds = DetailService
    @mds = DetailService.main_detail_services
    @dds = DetailService.deluxe_detail_services
    @ads = DetailService.additional_detail_services
    @ts = TintService.all
    @cbs = ClearBraService.all
  end
end
