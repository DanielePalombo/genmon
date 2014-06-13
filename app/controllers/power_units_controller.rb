class PowerUnitsController < ApplicationController
  before_action :set_power_unit, only: [:show, :edit, :update, :destroy, :add_informations]

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

  # PATCH/PUT /power_units/1/informations
  # PATCH/PUT /power_units/1/informations.json
  def add_informations
    #convert key to information
    #information_params = Hash[params.map do |k, obj| 
    information_params = {}
    params.each do |k, obj| 
      information_params[:power_unit] ||= HashWithIndifferentAccess.new 
      case k
      when 'dl'
        information_params[:power_unit][:diesel_informations_attributes] = [{:raw_value=>obj}]
      when 'gl'                                                                             
        information_params[:power_unit][:gpl_informations_attributes] =    [{:raw_value=>obj}]
      when 'ml'                                                                            
        information_params[:power_unit][:mixed_informations_attributes] =  [{:raw_value=>obj}]
      when 'da'                                                                           
        information_params[:power_unit][:diesel_alarms_attributes] =       [{:raw_value=>obj}]
      when 'ga'                                                                          
        information_params[:power_unit][:gpl_alarms_attributes] =       [{:raw_value=>obj}]
      when 's'                                                                          
        information_params[:power_unit][:states] =                         [{:raw_value=>obj}]
      else
        information_params[k] = obj
      end
    end

    respond_to do |format|
      p information_params
      if @power_unit.update(information_params[:power_unit])
        format.html { redirect_to @power_unit, notice: 'Power unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @power_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_power_unit
      @power_unit = PowerUnit.find(params[:id])
      if @power_unit.nil?
        @power_unit = PowerUnit.find_by_code params[:id]
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def power_unit_params
      params.require(:power_unit).permit(:code, :diesel_mixed_set)
    end
end
