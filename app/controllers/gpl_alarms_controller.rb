class GplAlarmsController < ApplicationController
  include InformationController

  before_action :set_gpl_alarm, only: [:show, :edit, :update, :destroy]

  # GET /gpl_alarms
  # GET /gpl_alarms.json
  def index
    @gpl_alarms = power_unit.gpl_alarms.all
  end

  # GET /gpl_alarms/1
  # GET /gpl_alarms/1.json
  def show
  end

  # GET /gpl_alarms/new
  def new
    @gpl_alarm = power_unit.gpl_alarms.new
  end

  # GET /gpl_alarms/1/edit
  def edit
  end

  # POST /gpl_alarms
  # POST /gpl_alarms.json
  def create
    @gpl_alarm = power_unit.gpl_alarms.new(alarm_params)

    respond_to do |format|
      if @gpl_alarm.save
        format.html { redirect_to power_unit_gpl_alarm_path(@power_unit, @gpl_alarm), notice: 'Alarm was successfully created.' }
        format.json { render action: 'show', status: :created, location: power_unit_gpl_alarm_path(@power_unit, @gpl_alarm) }
      else
        format.html { render action: 'new' }
        format.json { render json: @gpl_alarm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gpl_alarms/1
  # PATCH/PUT /gpl_alarms/1.json
  def update
    respond_to do |format|
      if @gpl_alarm.update(alarm_params)
        format.html { redirect_to power_unit_gpl_alarm_path(@power_unit, @gpl_alarm), notice: 'Alarm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gpl_alarm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gpl_alarms/1
  # DELETE /gpl_alarms/1.json
  def destroy
    @gpl_alarm.destroy
    respond_to do |format|
      format.html { redirect_to power_unit_gpl_alarms_url(@power_unit) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gpl_alarm
      @gpl_alarm = power_unit.gpl_alarms.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alarm_params
      params.require(:gpl_alarm).permit(:raw_value, :state)
    end
end
