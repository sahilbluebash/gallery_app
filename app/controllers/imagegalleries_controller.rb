class ImagegalleriesController < ApplicationController
  before_action :set_imagegallery, only: [:show, :edit, :update, :destroy ]
 
  # GET /imagegalleries
  # GET /imagegalleries.json
 
  # def index
   
  #     @imagegalleries = current_user.imagegalleries.page( params[:page])
  
  # end

  def index
    @q = Imagegallery.ransack(params[:q])  
    if current_user && current_user.admin?     
      @imagegalleries = Imagegallery.all.page(params[:page])
      @imagegalleries = @q.result.page(params[:page])
    elsif current_user
      @imagegalleries = current_user.imagegalleries.page(params[:page])       
      @q  = current_user.imagegalleries.ransack(params[:q])       
      @imagegalleries = @q.result.page(params[:page])
    end    
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
        ImagegalleryMailer.new_imagegallery(@imagegallery).deliver_now
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
          if current_user && current_user.admin?
            ImagegalleryMailer.edit_imagegallery(@imagegallery).deliver_now
          end
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
      
    if current_user && current_user.admin?
    ImagegalleryMailer.destroy_imagegallery(@imagegallery).deliver_now
    end

    respond_to do |format|
      format.html { redirect_to imagegalleries_url, notice: 'Imagegallery was successfully destroyed.' }
      format.json { head :no_content } 
    end
  end

  def delete_upload
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge 
    redirect_back(fallback_location: imagegalleries_url)
  end
 
  # All Images shown here
  # def showallimages    
  #   if user_signed_in?  
              
  #       @imagegalleries = current_user.imagegalleries.page( params[:page])
      
  #       redirect_to "/imagegalleries"
  
  #   else
  #       @imagegalleries = Imagegallery.all.page( params[:page])
    
  #       render template: "imagegalleries/showallimages"
  #   end
  # end
# def showallimages
#   if  current_user && current_user.admin?
#     @imagegalleries = Imagegallery.all.page( params[:page])
    
#         render template: "imagegalleries/showadminpage"
#   elsif user_signed_in?
#     @imagegalleries = current_user.imagegalleries.page( params[:page])
      
#         redirect_to "/imagegalleries"
#   else
#     @imagegalleries = Imagegallery.all.page( params[:page])
    
#     render template: "imagegalleries/showallimages"
#   end
# end

  def showallimages 
    if current_user && current_user.admin?
      @imagegalleries = Imagegallery.all.page(params[:page])
      @q = Imagegallery.ransack(params[:q])  
      @imagegalleries = @q.result.page(params[:page])
    elsif current_user
    # @imagegalleries = current_user.imagegalleries.page(params[:page])

    @imagegalleries = Imagegallery.all.page(params[:page])
      redirect_to "/imagegalleries"
      @q  = current_user.imagegalleries.ransack(params[:q])       
      @imagegalleries = @q.result.page(params[:page])
    else
      @imagegalleries = Imagegallery.all.page(params[:page])
      @q = Imagegallery.ransack(params[:q])  
      @imagegalleries = @q.result.page(params[:page])
    end    
  end

  def showgallery
    if current_user 
      @imagegalleries = Imagegallery.all.page(params[:page])
      @q = Imagegallery.ransack(params[:q])  
      @imagegalleries = @q.result.page(params[:page])

    else
      @imagegalleries = Imagegallery.all.page(params[:page])
      @q = Imagegallery.ransack(params[:q])  
      @imagegalleries = @q.result.page(params[:page])
    end
  end

  def tagged
    if params[:tag].present?
      if current_user && current_user.admin?
        @imagegalleries=Imagegallery.tagged_with(params[:tag]).page( params[:page])
        render template: "imagegalleries/showrelatedtags"
      elsif current_user
        @imagegalleries=current_user.imagegalleries.tagged_with(params[:tag]).page( params[:page])
        render template: "imagegalleries/showrelatedtags"        
      end
    else
      @imagegalleries = Imagegallery.all
    end
  end
 
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_imagegallery
    @imagegallery = Imagegallery.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def imagegallery_params
    params.require(:imagegallery).permit(:title, :caption, :tag_list, :public , images: [] )
  end

end
