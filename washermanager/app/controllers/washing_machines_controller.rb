class WashingMachinesController < ApplicationController
  before_action :set_washing_machine, only: [:show, :edit, :update, :destroy]

  # GET /washing_machines
  # GET /washing_machines.json
  def index
    @washing_machines = WashingMachine.all
  end

  # GET /washing_machines/1
  # GET /washing_machines/1.json
  def show
  end

  # GET /washing_machines/new
  def new
    @washing_machine = WashingMachine.new
  end

  # GET /washing_machines/1/edit
  def edit
  end

  # POST /washing_machines
  # POST /washing_machines.json
  def create
    @washing_machine = WashingMachine.new(washing_machine_params)

    respond_to do |format|
      if @washing_machine.save
        format.html { redirect_to @washing_machine, notice: 'Washing machine was successfully created.' }
        format.json { render :show, status: :created, location: @washing_machine }
      else
        format.html { render :new }
        format.json { render json: @washing_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /washing_machines/1
  # PATCH/PUT /washing_machines/1.json
  def update
    respond_to do |format|
      if @washing_machine.update(washing_machine_params)
        format.html { redirect_to @washing_machine, notice: 'Washing machine was successfully updated.' }
        format.json { render :show, status: :ok, location: @washing_machine }
      else
        format.html { render :edit }
        format.json { render json: @washing_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /washing_machines/1
  # DELETE /washing_machines/1.json
  def destroy
    @washing_machine.destroy
    respond_to do |format|
      format.html { redirect_to washing_machines_url, notice: 'Washing machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_washing_machine
      @washing_machine = WashingMachine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def washing_machine_params
      params.require(:washing_machine).permit(:floor, :dorm, :state)
    end
end
