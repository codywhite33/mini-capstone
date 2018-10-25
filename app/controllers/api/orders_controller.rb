class Api::OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params["product_id"])

    @order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"] ,
      subtotal: product.price * params["quantity"].to_i ,
      tax: (product.price * params["quantity"].to_i) * 0.09 ,
      total: (product.price * params["quantity"].to_i) + ((product.price * params["quantity"].to_i) * 0.09)
      )
    if @order.save
      render "order.json.jbuilder"
    else 
      render json: {error: @product.errors.full_messages}, status: 422
    end
  end
  def show
    @order = Order.where(user_id: params[:id])
    render "order.json.jbuilder"

  end
end
