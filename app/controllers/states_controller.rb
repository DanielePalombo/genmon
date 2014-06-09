class StatesController < ApplicationController
  include InformationController

  before_action :set_state, only: [:show, :edit, :update, :destroy]

  # GET /states
  # GET /states.json
  def index
    @states = power_unit.states.all
  end

  # GET /states/1
  # GET /states/1.json
  def show
  end

  # GET /states/new
  def new
    @state = power_unit.states.new
  end

  # GET /states/1/edit
  def edit
  end

  # POST /states
  # POST /states.json
  def create
    @state = power_unit.states.new(alarm_params)

    respond_to do |format|
      if @state.save
        format.html { redirect_to power_unit_state_path(@power_unit, @state), notice: 'Alarm was successfully created.' }
        format.json { render action: 'show', status: :created, location: power_unit_state_path(@power_unit, @state) }
      else
        format.html { render action: 'new' }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /states/1
  # PATCH/PUT /states/1.json
  def update
    respond_to do |format|
      if @state.update(alarm_params)
        format.html { redirect_to power_unit_state_path(@power_unit, @state), notice: 'Alarm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /states/1
  # DELETE /states/1.json
  def destroy
    @state.destroy
    respond_to do |format|
      format.html { redirect_to power_unit_states_url(@power_unit) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = power_unit.states.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alarm_params
      params.require(:state).permit(:raw_value, :state)
    end
end
