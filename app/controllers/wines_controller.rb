class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]
  before_action :provide_params

  
  def subregion_options
  render partial: 'subregion_select'
  end
  
  
  # GET /wines
  # GET /wines.json
  def index
    @wines = Wine.all
    @items = @wines
    @items_name="Weine"
    @item_name="Wein"
    @item_partial="/wines/wine"
    @modal=false
    @controller_name="wines"
    render '/shared/crudajax'
  end

  # GET /wines/1
  # GET /wines/1.json
  def show
  end

  # GET /wines/new
  def new
    @wine = Wine.new
    @wine.images.build
    @wine.shop_sells_wines.build
  end

  # GET /wines/1/edit
  def edit
    @wine.images.build
    @wine.shop_sells_wines.build
  end
  
  
  def availableGrapeTypes
    grapesName= Grape.all.map{|f| f.name}
    request.format = :json
    
    respond_to do |format|
    format.json  { render :json => grapesName } # don't do msg.to_json
  end
    
  end
  
  # POST /wines
  # POST /wines.json
  def create
    @wine = Wine.new(wine_params)
    @wine.user= current_user
    parse_and_insert
    respond_to do |format|
      if @wine.save
        format.html { redirect_to action: 'index', notice: 'Wine was successfully created.' }
        format.json { render action: 'index', status: :created, location: @wine }
      else
        format.html { render action: 'new' }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wines/1
  # PATCH/PUT /wines/1.json
  def update
    parse_and_insert
     @wine.shop_sells_wines=[]
    respond_to do |format|
      if @wine.update(wine_params)
        format.html { redirect_to action: 'index', notice: 'Wine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1
  # DELETE /wines/1.json
  def destroy
    @wine.destroy
    respond_to do |format|
      format.html { redirect_to wines_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wine_params
      params.require(:wine).permit(:name, :year, :wine_type, :country_code, :subregion_code,images_attributes:  [:picture], shop_sells_wines_attributes: [:shop_id ,:price])
    end
  
  def provide_params
      @grape_names=Grape.all.map{|f| f.name}.sort_by{|word| word.downcase}
      @food_names=Food.all.map{|f| f.name}.sort_by{|word| word.downcase}
  end
  
  def parse_and_insert
    @wine.grapes.build
    @wine.grapes=[]
    if params[:grapes].length>=3
    params[:grapes].split(',').each { |item|  @wine.grapes << Grape.find_or_create(item.strip)  }
    end


    @wine.foods.build
    @wine.foods=[]
    if params[:foods].length>=3
      params[:foods].split(',').each { |item|  @wine.foods << Food.find_or_create(item.strip)  }
    end


  end
end
