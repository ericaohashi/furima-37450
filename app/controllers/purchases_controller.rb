class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_params, only:[:index,:create]

  def index
    if current_user.id == @item.user_id
      redirect_to root_path
     end
    @purchases_shipping = PurchasesShipping.new
    
  end

  def create
    @purchases_shipping = PurchasesShipping.new(purchase_params)
    if @purchases_shipping.valid?
      pay_item
      @purchases_shipping.save
      return redirect_to root_path
    else
      render :index
    end
  end


  private
  def purchase_params
    params.require(:purchases_shipping).permit(:post, :prefecture_id, :city, :address, :building, :phone, :purchase ).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key = "sk_test_f762a860c9a64a2c267148e7"
      Payjp::Charge.create(
        amount: @item.price,  
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )
    end

  def item_params
    @item = Item.find(params[:item_id])
  end
end


