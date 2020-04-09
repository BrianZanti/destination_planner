class Api::V1::DestinationController < ApplicationController
  def show
    destination_facade = DestinationFacade.new(params[:id])
    render json: DestinationSerializer.new(destination_facade)
  end
end
