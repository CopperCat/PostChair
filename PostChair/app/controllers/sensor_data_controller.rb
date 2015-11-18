class SensorDataController < ApplicationController
  before_action :set_sensor_data, only: [:show, :edit, :update, :destroy]

  # GET /sensor_data
  # GET /sensor_data.json
  def index
    @sensor_data = SensorData.by_time
  end

  # GET /sensor_data/1
  # GET /sensor_data/1.json
  def show
  end

  # GET /sensor_data/new
  def new
    @sensor_data = SensorData.new
  end

  # GET /sensor_data/1/edit
  def edit
  end

  # POST /sensor_data
  # POST /sensor_data.json
  def create
    @sensor_data = SensorData.new(sensor_data_params)

    respond_to do |format|
      if @sensor_data.save
        format.html { redirect_to @sensor_data, notice: 'Sensor data was successfully created.' }
        format.json { render :show, status: :created, location: @sensor_data }
      else
        format.html { render :new }
        format.json { render json: @sensor_data.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sensor_data/1
  # PATCH/PUT /sensor_data/1.json
  def update
    respond_to do |format|
      if @sensor_data.update(sensor_data_params)
        format.html { redirect_to @sensor_data, notice: 'Sensor data was successfully updated.' }
        format.json { render :show, status: :ok, location: @sensor_data }
      else
        format.html { render :edit }
        format.json { render json: @sensor_data.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sensor_data/1
  # DELETE /sensor_data/1.json
  def destroy
    @sensor_data.destroy
    respond_to do |format|
      format.html { redirect_to sensor_data_url, notice: 'Sensor data was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor_data
      @sensor_data = SensorData.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sensor_data_params
      params.require(:sensor_data).permit(:user_id_id, :position, :time, :measurement)
    end
end
