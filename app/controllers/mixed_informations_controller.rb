# mixed INFORMATION
class MixedInformationsController < ApplicationController
  include InformationController

  before_action :set_power_unit
  before_action :set_mixed_information, only: [:show, :edit, :update, :destroy]

  # GET /mixed_informations
  # GET /mixed_informations.json
  def index
    @mixed_informations = @power_unit.mixed_informations.all

    min_date = @power_unit.mixed_informations.first.created_at
    max_date = @power_unit.mixed_informations.last.created_at

    min_date ||= DateTime.now
    max_date ||= DateTime.now

    respond_to do |format|
      format.html
      format.json
      format.csv  do 
        headers['Content-Disposition'] = "attachment; filename=\"mixed_#{@power_unit.code}_#{min_date.strftime("%Y/%m/%d_%H%M")}_#{max_date.strftime("%Y/%m/%d_%H%M")}.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  # GET /mixed_informations/1
  # GET /mixed_informations/1.json
  def show
  end

  # GET /mixed_informations/new
  def new
    @mixed_information = @power_unit.mixed_informations.new
  end

  # GET /mixed_informations/1/edit
  def edit
  end

  # POST /mixed_informations
  # POST /mixed_informations.json
  def create
    @mixed_information = @power_unit.mixed_informations.new(mixed_information_params)

    respond_to do |format|
      if @mixed_information.save
        format.html { redirect_to power_unit_mixed_information_path(@power_unit, @mixed_information), notice: 'mixed information was successfully created.' }
        format.json { render action: 'show', status: :created, location: power_unit_mixed_information_path(@power_unit, @mixed_information) }
      else
        format.html { render action: 'new' }
        format.json { render json: @mixed_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mixed_informations/1
  # PATCH/PUT /mixed_informations/1.json
  def update
    respond_to do |format|
      if @mixed_information.update(mixed_information_params)
        format.html { redirect_to power_unit_mixed_information_path(@power_unit, @mixed_information), notice: 'mixed information was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mixed_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mixed_informations/1
  # DELETE /mixed_informations/1.json
  def destroy
    @mixed_information.destroy
    respond_to do |format|
      format.html { redirect_to power_unit_mixed_informations_url(@power_unit) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mixed_information
      @mixed_information = @power_unit.mixed_informations.find(params[:id])
    end

    def set_power_unit
      p params
      @power_unit = PowerUnit.find(params[:power_unit_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mixed_information_params
      params.require(:mixed_information).permit(:raw_value, :level)
    end
end
