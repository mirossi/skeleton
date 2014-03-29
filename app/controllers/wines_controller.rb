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
    @myRating= Rating.find_by_wine_id_and_user_id(@wine.id,current_user.id);
    @myRating= Rating.new(user_id: current_user.id) if @myRating.nil?
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
        format.html { redirect_to action: 'show', notice: 'Wine was successfully created.' }
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

    #destroy elements which were not any more in the params
    old_items=@wine.shop_sells_wines.map {|i| i.id if !i.id.nil?}
    new_items=[]
    wine_params[:shop_sells_wines_attributes].each {|key, value| new_items.push(value[:id].to_i)} if !wine_params[:shop_sells_wines_attributes].nil?
    ShopSellsWine.find(old_items-new_items).each {|i| i.destroy}


    respond_to do |format|
      if @wine.update(wine_params)
        format.html { redirect_to action: 'show', notice: 'Wine was successfully updated.' }
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
  
  def addImage
    request.format = :json
    newid=0
    wine= Wine.find(params[:wine_id])
    if !wine.nil?

      img=Image.new
      img.picture=params[:image][:picture]
      wine.images.push(img)
      if wine.save()
        newid=img.id
      end
    end

    respond_to do |format|
    format.json  { render :json => newid }
    end      
  end

  def addMyRating
    rating= Rating.find_by_wine_id_and_user_id(params[:wine_id],current_user.id);
    if(rating.nil?)
      rating= Rating.new(rating_params)
      rating[:wine_id]= params[:wine_id]
      rating[:user_id]= current_user.id
     rating.save
    else
      rating.update(rating_params)
     end
    respond_to do |format|
        format.html { redirect_to action: 'show', notice: 'Rating was added' }
        format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
      
      @theRating=0
      @theTotPerson=0
      @wine.ratings.each {|i| if(i!=-1); @theRating+=i.rating; @theTotPerson+=1; end;}
      @theRating/=@theTotPerson if @theTotPerson!=0
        
  
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wine_params
      params.require(:wine).permit(:name, :year, :wine_type, :country_code, :comment, :subregion_code,images_attributes:  [:picture], shop_sells_wines_attributes: [:id, :shop_id ,:price, :user_id])
    end

  def rating_params
    params.require(:rating).permit(:user_id, :rating, :comment)
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
