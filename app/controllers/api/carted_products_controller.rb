class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user
  def index
    @carted_products = CartedProduct.where(status: "carted")
    render "cart.json.jbuilder"
  end

  def create
    @carted_product = CartedProduct.new(
      status: "carted",
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"]
      )
    @carted_product.save
    render json: {message: "Product(s) added!"}
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params["cart_id"])
    @carted_product.status = "removed"
    @carted_product.save
    render json: {message: "Item(s) removed!"}
  end

end
