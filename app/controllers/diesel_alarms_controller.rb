class DieselAlarmsController < ApplicationController
  include InformationController

  before_action :set_diesel_alarm, only: [:show, :edit, :update, :destroy]

  # GET /diesel_alarms
  # GET /diesel_alarms.json
  def index
    @diesel_alarms = power_unit.diesel_alarms.all
  end

  # GET /diesel_alarms/1
  # GET /diesel_alarms/1.json
  def show
  end

  # GET /diesel_alarms/new
  def new
    @diesel_alarm = power_unit.diesel_alarms.new
  end

  # GET /diesel_alarms/1/edit
  def edit
  end

  # POST /diesel_alarms
  # POST /diesel_alarms.json
  def create
    @diesel_alarm = power_unit.diesel_alarms.new(alarm_params)

    respond_to do |format|
      if @diesel_alarm.save
        format.html { redirect_to power_unit_diesel_alarm_path(@power_unit, @diesel_alarm), notice: 'Alarm was successfully created.' }
        format.json { render action: 'show', status: :created, location: power_unit_diesel_alarm_path(@power_unit, @diesel_alarm) }
      else
        format.html { render action: 'new' }
        format.json { render json: @diesel_alarm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diesel_alarms/1
  # PATCH/PUT /diesel_alarms/1.json
  def update
    respond_to do |format|
      if @diesel_alarm.update(alarm_params)
        format.html { redirect_to power_unit_diesel_alarm_path(@power_unit, @diesel_alarm), notice: 'Alarm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @diesel_alarm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diesel_alarms/1
  # DELETE /diesel_alarms/1.json
  def destroy
    @diesel_alarm.destroy
    respond_to do |format|
      format.html { redirect_to power_unit_diesel_alarms_url(@power_unit) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diesel_alarm
      @diesel_alarm = power_unit.diesel_alarms.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alarm_params
      params.require(:diesel_alarm).permit(:raw_value, :state)
    end
end
