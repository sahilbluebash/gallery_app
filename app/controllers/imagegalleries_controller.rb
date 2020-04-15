class ImagegalleriesController < ApplicationController
  before_action :set_imagegallery, only: [:show, :edit, :update, :destroy]
 
  # GET /imagegalleries
  # GET /imagegalleries.json
 
  def index
    @imagegalleries = current_user.imagegalleries.page( params[:page])
    
  end
  # GET /imagegalleries/1
  # GET /imagegalleries/1.json
  def show
  end

  # GET /imagegalleries/new
  def new
    @imagegallery = Imagegallery.new
  end

  # GET /imagegalleries/1/edit
  def edit
  end

  # POST /imagegalleries
  # POST /imagegalleries.json
  def create
    @imagegallery = Imagegallery.new(imagegallery_params)
    @imagegallery.user = current_user
    respond_to do |format|
      if @imagegallery.save
        format.html { redirect_to @imagegallery, notice: 'Imagegallery was successfully created.' }
        format.json { render :show, status: :created, location: @imagegallery }
      else
        format.html { render :new }
        format.json { render json: @imagegallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imagegalleries/1
  # PATCH/PUT /imagegalleries/1.json
  def update
    respond_to do |format|
      if @imagegallery.update(imagegallery_params)
        format.html { redirect_to @imagegallery, notice: 'Imagegallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @imagegallery }
      else
        format.html { render :edit }
        format.json { render json: @imagegallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imagegalleries/1
  # DELETE /imagegalleries/1.json
  def destroy
    @imagegallery.destroy
    respond_to do |format|
      format.html { redirect_to imagegalleries_url, notice: 'Imagegallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # All Images shown here
  def showallimages
    if user_signed_in?            
      @imagegalleries = current_user.imagegalleries.page( params[:page])
     
      redirect_to "/imagegalleries"
    else
    @imagegalleries = Imagegallery.all.page( params[:page])
 
    render template: "imagegalleries/showallimages"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imagegallery
      @imagegallery = Imagegallery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def imagegallery_params
      params.require(:imagegallery).permit(:title, :caption, :image)
    end

    

end
