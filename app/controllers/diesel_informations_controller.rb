# DIESEL INFORMATION
class DieselInformationsController < ApplicationController
  include InformationController

  before_action :set_power_unit
  before_action :set_diesel_information, only: [:show, :edit, :update, :destroy]

  # GET /diesel_informations
  # GET /diesel_informations.json
  def index
    @diesel_informations = @power_unit.diesel_informations.all
  end

  # GET /diesel_informations/1
  # GET /diesel_informations/1.json
  def show
  end

  # GET /diesel_informations/new
  def new
    @diesel_information = @power_unit.diesel_informations.new
  end

  # GET /diesel_informations/1/edit
  def edit
  end

  # POST /diesel_informations
  # POST /diesel_informations.json
  def create
    @diesel_information = @power_unit.diesel_informations.new(diesel_information_params)

    respond_to do |format|
      if @diesel_information.save
        format.html { redirect_to power_unit_diesel_information_path(@power_unit, @diesel_information), notice: 'Diesel information was successfully created.' }
        format.json { render action: 'show', status: :created, location: power_unit_diesel_information_path(@power_unit, @diesel_information) }
      else
        format.html { render action: 'new' }
        format.json { render json: @diesel_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diesel_informations/1
  # PATCH/PUT /diesel_informations/1.json
  def update
    respond_to do |format|
      if @diesel_information.update(diesel_information_params)
        format.html { redirect_to power_unit_diesel_information_path(@power_unit, @diesel_information), notice: 'Diesel information was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @diesel_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diesel_informations/1
  # DELETE /diesel_informations/1.json
  def destroy
    @diesel_information.destroy
    respond_to do |format|
      format.html { redirect_to power_unit_diesel_informations_url(@power_unit) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diesel_information
      @diesel_information = @power_unit.diesel_informations.find(params[:id])
    end

    def set_power_unit
      p params
      @power_unit = PowerUnit.find(params[:power_unit_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diesel_information_params
      params.require(:diesel_information).permit(:raw_value, :level)
    end
end
