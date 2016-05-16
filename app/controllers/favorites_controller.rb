class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
      #@user = User.find_by id: params[:id]   
      @user = User.find_by id: params[:id]

      if @user
          render json: {
              success: true,
              user: @user,
              favorites: @user.favorites

          },
          except: [:salt, :password]
      else
      render json: {
          success: false,
         errors: ["404 No se encontro el usuario"]
      }
      end
  end
 
  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  # POST /favorites.json
  def create
    @u = Favorite.where(user_id: favorite_params[:user_id])
    
    if !@u.exists?(movie_id: favorite_params[:movie_id])
      @favorite = Favorite.new(favorite_params)

      respond_to do |format|
        if @favorite.save
          format.html { redirect_to @favorite, notice: 'Favorite was successfully created.' }
          format.json { render :show, status: :created, location: @favorite }
        else
          format.html { render :new }
          format.json { render json: @favorite.errors, status: :unprocessable_entity }
        end
      end
    else
      render json: {errors:["ya existe el favorito"]}
    end
  end

  # PATCH/PUT /favorites/1
  # PATCH/PUT /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: 'Favorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:movie_id, :user_id)
    end
end
