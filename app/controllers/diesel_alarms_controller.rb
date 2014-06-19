class RedAlarmsController < ApplicationController
  include InformationController

  before_action :set_red_alarm, only: [:show, :edit, :update, :destroy]

  # GET /red_alarms
  # GET /red_alarms.json
  def index
    @red_alarms = power_unit.red_alarms.all
  end

  # GET /red_alarms/1
  # GET /red_alarms/1.json
  def show
  end

  # GET /red_alarms/new
  def new
    @red_alarm = power_unit.red_alarms.new
  end

  # GET /red_alarms/1/edit
  def edit
  end

  # POST /red_alarms
  # POST /red_alarms.json
  def create
    @red_alarm = power_unit.red_alarms.new(alarm_params)

    respond_to do |format|
      if @red_alarm.save
        format.html { redirect_to power_unit_red_alarm_path(@power_unit, @red_alarm), notice: 'Alarm was successfully created.' }
        format.json { render action: 'show', status: :created, location: power_unit_red_alarm_path(@power_unit, @red_alarm) }
      else
        format.html { render action: 'new' }
        format.json { render json: @red_alarm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /red_alarms/1
  # PATCH/PUT /red_alarms/1.json
  def update
    respond_to do |format|
      if @red_alarm.update(alarm_params)
        format.html { redirect_to power_unit_red_alarm_path(@power_unit, @red_alarm), notice: 'Alarm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @red_alarm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /red_alarms/1
  # DELETE /red_alarms/1.json
  def destroy
    @red_alarm.destroy
    respond_to do |format|
      format.html { redirect_to power_unit_red_alarms_url(@power_unit) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_red_alarm
      @red_alarm = power_unit.red_alarms.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alarm_params
      params.require(:red_alarm).permit(:raw_value, :state)
    end
end
