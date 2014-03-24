class TastersController < ApplicationController
  def index
    @users = User.all
    @items = @users
    @items_name="Tasters"
    @item_name="Taster"
    @item_partial="/tasters/taster"
    @modal=false
    @controller_name="tasters"
    render '/shared/crudajax'
  end
end
