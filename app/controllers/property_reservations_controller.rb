class PropertyReservationsController < ApplicationController
  before_action :authenticate_property_owner!, only: %i[accept]
  before_action :authenticate_user!, only: %i[create]

  def show
      @property_reservation = PropertyReservation.find(params[:id])
  end

  def create
      @property_reservation = current_user.property_reservations.new(property_reservation_params)
      #@property_reservation.user = current_user
      #usa-se :property_id para especificar
      @property_reservation.property = Property.find(params[:property_id]) 
      @property_reservation.save!

      redirect_to @property_reservation, notice: t('.success')
  end
  
  def accept
    @property_reservation = PropertyReservation.find(params[:id])
    @property_reservation.accepted!
    redirect_to @property_reservation.property, 
    notice: 'Reserva Aceita com com sucesso!'
  end

  private

  def property_reservation_params
      params.require(:property_reservation).permit(:start_date, :end_date, :guests)
  end
end