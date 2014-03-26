class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /shops
  # GET /shops.json
  def index
    @items = Shop.all
    @items_name="Shops"
    @item_name="Shop"
    @item_partial="/shops/shop"
    @controller_name="shops"
    @modal=true
    render '/shared/crudajax'
  end

  # GET /shops/1
  # GET /shops/1.json
  def show

  end

  def availableShops
    shopsall= Shop.all.map{|f| [text: f.name, value: f.id]}
    request.format = :json

    respond_to do |format|
      format.json  { render :json => shopsall } # don't do msg.to_json
    end

  end

    # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)
     @shop.user= current_user
    respond_to do |format|
      if @shop.save
        format.html { redirect_to shops_url, notice: 'Shop was successfully created.' }
        format.json { render action: 'show', status: :created, location: @shop }
      else
        format.html {render action: 'edit' }
        format.html { render action: 'new' }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
       # response.headers["status"]="200"
        format.html { redirect_to shops_url, notice: 'Shop was successfully updated.' }
        format.json { head :no_content }
      else
        #response.headers["status"]="202"
        format.html {render action: 'edit'}
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:name, :street, :zipcode, :city, :phone, :country_code)
    end
end
