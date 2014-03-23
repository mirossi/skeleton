class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def redir
    @image = Image.find(params[:id])
    if(!@image.nil? and @image.picture.exists?)
    if(params[:style]=='original')
      redirect_to @image.picture.url
     elsif (params[:style].nil?)
       redirect_to @image.picture.url
    else
       redirect_to @image.picture.url(params[:style])
    end
      
    else
      redirect_to ActionController::Base.helpers.asset_path("no-pic.jpg")
    end
  end
  
  # GET /images
  # GET /images.json
  def index
    @images = Image.all
    @items = @images
    @items_name="Bilder"
    @item_name="Bild"
    @item_partial="/images/image"
    @modal=true
    @controller_name="images"
    render '/shared/crudajax'
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create

    @image = Image.new(image_params)
    @image.user=current_user

    respond_to do |format|
      if @image.save
        format.html { redirect_to action: 'index', notice: 'Image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image }
      else
        format.html { render action: 'new' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to action: 'index', notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:picture, :name)
    end
end
