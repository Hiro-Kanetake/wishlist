class WishitemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  protect_from_forgery :except => [:destroy]

  def index
    @wishitems = Wishitem.all
  end

  def show
    @wishitem = Wishitem.find(params[:id])
  end

  def new
    @wishitem = Wishitem.new
  end

  def create
    @wishitem = Wishitem.new(wishitem_params)
    @wishitem.user_id = current_user.id
    if @wishitem.save
      redirect_to wishitem_path(@wishitem), notice: "Successfully added item to your wishlist!"
    else
      render :new
    end
  end

  def edit
    @wishitem = Wishitem.find(params[:id])
    if @wishitem.user != current_user
      redirect_to wishitems_path, alert: "Invalid Access"
    end 
  end

  def update
    @wishitem = Wishitem.find(params[:id])
    if @wishitem.update(wishitem_params)
      redirect_to wishitem_path(@wishitem), notice: "Successfully updated item in your wishlist!"
    else
      render :edit
    end
  end

  def destroy
    wishitem = Wishitem.find(params[:id])
    wishitem.destroy
    redirect_to user_path(wishitem.user), notice: "Item is removed"
  end

  private
  def wishitem_params
    params.require(:wishitem)
    .permit(:name, :description, :link, :sponsored)
    .with_defaults(sponsored: false)
  end

end
