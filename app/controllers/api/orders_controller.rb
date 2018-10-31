class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  def create
    # product = Product.find_by(id: params["product_id"])

    # @order = Order.new(
    #   user_id: current_user.id,
    #   product_id: params["product_id"],
    #   quantity: params["quantity"] ,
    #   subtotal: product.price * params["quantity"].to_i ,
    #   tax: (product.price * params["quantity"].to_i) * 0.09 ,
    #   total: (product.price * params["quantity"].to_i) + ((product.price * params["quantity"].to_i) * 0.09)
    #   )
      
    carted_products_gross = CartedProduct.where(status: "carted")
    sub_total = 0
    carted_products_gross.each do |carted_product|
      product = Product.find_by(id: carted_product.product_id)
      x = carted_product.quantity * product.price

      sub_total = sub_total + x
    end



    @order = Order.new(
      subtotal: sub_total,
      tax: sub_total * 0.09,
      total: sub_total * 1.09,
      user_id: current_user.id
      )
    if @order.save
      render "order.json.jbuilder"
    else 
      render json: {error: @order.errors.full_messages}, status: 422
    end

    carted_products_gross.each do |carted_product|
      carted_product.status = "purchased"
      carted_product.order_id = @order.id
      carted_product.save
    end

  end
  def index
    @orders = current_user.orders
    render "index.json.jbuilder"

  end
end
