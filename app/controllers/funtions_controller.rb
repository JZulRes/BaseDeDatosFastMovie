class FuntionsController < ApplicationController
  before_action :set_funtion, only: [:show, :edit, :update, :destroy]

  # GET /funtions
  # GET /funtions.json
  def index
    @funtions = Funtion.all
  end

  # GET /funtions/1
  # GET /funtions/1.json
  def show
  end

  # GET /funtions/new
  def new
    @funtion = Funtion.new
  end

  # GET /funtions/1/edit
  def edit
  end

  # POST /funtions
  # POST /funtions.json
  def create
    @funtion = Funtion.new(funtion_params)

    respond_to do |format|
      if @funtion.save
        format.html { redirect_to @funtion, notice: 'Funtion was successfully created.' }
        format.json { render :show, status: :created, location: @funtion }
      else
        format.html { render :new }
        format.json { render json: @funtion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funtions/1
  # PATCH/PUT /funtions/1.json
  def update
    respond_to do |format|
      if @funtion.update(funtion_params)
        format.html { redirect_to @funtion, notice: 'Funtion was successfully updated.' }
        format.json { render :show, status: :ok, location: @funtion }
      else
        format.html { render :edit }
        format.json { render json: @funtion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funtions/1
  # DELETE /funtions/1.json
  def destroy
    @funtion.destroy
    respond_to do |format|
      format.html { redirect_to funtions_url, notice: 'Funtion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funtion
      @funtion = Funtion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funtion_params
      params.require(:funtion).permit(:movie_id, :hora, :sala, :theater_id)
    end
end
