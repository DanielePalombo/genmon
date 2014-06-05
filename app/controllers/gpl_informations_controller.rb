# gpl INFORMATION
class GplInformationsController < ApplicationController
  include Levelable

  before_action :set_power_unit
  before_action :set_gpl_information, only: [:show, :edit, :update, :destroy]

  # GET /gpl_informations
  # GET /gpl_informations.json
  def index
    @gpl_informations = @power_unit.gpl_informations.all
  end

  # GET /gpl_informations/1
  # GET /gpl_informations/1.json
  def show
  end

  # GET /gpl_informations/new
  def new
    @gpl_information = @power_unit.gpl_informations.new
  end

  # GET /gpl_informations/1/edit
  def edit
  end

  # POST /gpl_informations
  # POST /gpl_informations.json
  def create
    @gpl_information = @power_unit.gpl_informations.new(gpl_information_params)

    respond_to do |format|
      if @gpl_information.save
        format.html { redirect_to power_unit_gpl_information_path(@power_unit, @gpl_information), notice: 'Gpl information was successfully created.' }
        format.json { render action: 'show', status: :created, location: power_unit_gpl_information_path(@power_unit, @gpl_information) }
      else
        format.html { render action: 'new' }
        format.json { render json: @gpl_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gpl_informations/1
  # PATCH/PUT /gpl_informations/1.json
  def update
    respond_to do |format|
      if @gpl_information.update(gpl_information_params)
        format.html { redirect_to power_unit_gpl_information_path(@power_unit, @gpl_information), notice: 'Gpl information was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gpl_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gpl_informations/1
  # DELETE /gpl_informations/1.json
  def destroy
    @gpl_information.destroy
    respond_to do |format|
      format.html { redirect_to power_unit_gpl_informations_url(@power_unit) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gpl_information
      @gpl_information = @power_unit.gpl_informations.find(params[:id])
    end

    def set_power_unit
      p params
      @power_unit = PowerUnit.find(params[:power_unit_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gpl_information_params
      params.require(:gpl_information).permit(:raw_value, :level)
    end
end
