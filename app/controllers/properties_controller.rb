class PropertiesController < ApplicationController
    before_action :authenticate_property_owner!, only: [:new,  :create]

    def show
        @property = Property.find(params[:id])
    end

    def new
        @property = Property.new
    end

    def create
        @property = Property.new(parametros)
        if @property.save                 
            redirect_to @property
        else
            render :new
        end
    end

    def edit
        @property = Property.find(params[:id])
    end
    
    def update
        @property = Property.find(params[:id])
        @property.update(parametros)
        if @property.persisted?
            redirect_to @property
        else
            render :edit
        end

    end

    private
    def parametros
        params.require(:property).permit(:title, :description, 
                        :rooms, :parking_slot, :bathrooms, :pets, :daily_rate, :property_type_id, :property_location_id)
    end
end