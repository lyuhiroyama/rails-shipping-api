class ShipmentsController < ApplicationController
  def index
    @shipments = Shipment.all
  end

  def show
    @shipment = Shipment.find(params[:id])
  end

  def new
    @shipment = Shipment.new
  end

  def create
    @shipment = Shipment.new(shipment_params)
    if @shipment.save
      redirect_to @shipment, notice: "Shipment record successfully created"
    else
      flash.now[:alert] = "Oops! there were errors in your form."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @shipment = Shipment.find(params[:id])
  end

  def update
    @shipment = Shipment.find(params[:id])
    if @shipment.update(shipment_params)
      redirect_to @shipment, notice: "Shipment record successfully updated"
    else
      flash.now[:alert] = "Oops! there were errors in your form."
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @shipment = Shipment.find(params[:id])
    @shipment.destroy
    redirect_to shipments_path, notice: "Shipment record successfully destroyed"
  end

  private_methods

  def shipment_params
    params.expect(
      shipment: [ :tracking_number, :status, :origin, :destination ]
    )
  end
end
