class PowerUnitsController < ApplicationController
  before_action :set_power_unit, only: [:show, :edit, :update, :destroy]

  # GET /power_units
  # GET /power_units.json
  def index
    @power_units = PowerUnit.all
  end

  # GET /power_units/1
  # GET /power_units/1.json
  def show
  end

  # GET /power_units/new
  def new
    @power_unit = PowerUnit.new
  end

  # GET /power_units/1/edit
  def edit
  end

  # POST /power_units
  # POST /power_units.json
  def create
    @power_unit = PowerUnit.new(power_unit_params)

    respond_to do |format|
      if @power_unit.save
        format.html { redirect_to @power_unit, notice: 'Power unit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @power_unit }
      else
        format.html { render action: 'new' }
        format.json { render json: @power_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /power_units/1
  # PATCH/PUT /power_units/1.json
  def update
    respond_to do |format|
      if @power_unit.update(power_unit_params)
        format.html { redirect_to @power_unit, notice: 'Power unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @power_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /power_units/1
  # DELETE /power_units/1.json
  def destroy
    @power_unit.destroy
    respond_to do |format|
      format.html { redirect_to power_units_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_power_unit
      @power_unit = PowerUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def power_unit_params
      params.require(:power_unit).permit(:code)
    end
end
