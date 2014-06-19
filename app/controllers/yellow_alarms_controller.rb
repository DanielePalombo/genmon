class YellowAlarmsController < ApplicationController
  include InformationController

  before_action :set_yellow_alarm, only: [:show, :edit, :update, :destroy]

  # GET /yellow_alarms
  # GET /yellow_alarms.json
  def index
    @yellow_alarms = power_unit.yellow_alarms.all
  end

  # GET /yellow_alarms/1
  # GET /yellow_alarms/1.json
  def show
  end

  # GET /yellow_alarms/new
  def new
    @yellow_alarm = power_unit.yellow_alarms.new
  end

  # GET /yellow_alarms/1/edit
  def edit
  end

  # POST /yellow_alarms
  # POST /yellow_alarms.json
  def create
    @yellow_alarm = power_unit.yellow_alarms.new(alarm_params)

    respond_to do |format|
      if @yellow_alarm.save
        format.html { redirect_to power_unit_yellow_alarm_path(@power_unit, @yellow_alarm), notice: 'Alarm was successfully created.' }
        format.json { render action: 'show', status: :created, location: power_unit_yellow_alarm_path(@power_unit, @yellow_alarm) }
      else
        format.html { render action: 'new' }
        format.json { render json: @yellow_alarm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yellow_alarms/1
  # PATCH/PUT /yellow_alarms/1.json
  def update
    respond_to do |format|
      if @yellow_alarm.update(alarm_params)
        format.html { redirect_to power_unit_yellow_alarm_path(@power_unit, @yellow_alarm), notice: 'Alarm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @yellow_alarm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yellow_alarms/1
  # DELETE /yellow_alarms/1.json
  def destroy
    @yellow_alarm.destroy
    respond_to do |format|
      format.html { redirect_to power_unit_yellow_alarms_url(@power_unit) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yellow_alarm
      @yellow_alarm = power_unit.yellow_alarms.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alarm_params
      params.require(:yellow_alarm).permit(:raw_value, :state)
    end
end
