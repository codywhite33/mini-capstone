class Api::ProductsController < ApplicationController

  def index
    @all_products = Product.all
    render "products.json.jbuilder"
  end
  def show
    @item = Product.find_by(id: params[:id])
    render "show.json.jbuilder"
  end
  def create
    @item = Product.new(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      image_url: params["image_url"]
      )
    @item.save
    render "show.json.jbuilder"
  end
  def update
    @item = Product.find_by(id: params[:id])
    @item.name = params["name"] || @item.name
    @item.image_url = params["image_url"] || @item.image_url
    @item.description = params["description"] || @item.description
    @item.price = params["price"] || @item.price
    @item.save
    render "show.json.jbuilder"
  end
  def destroy
    @item = Product.find_by(id: params[:id])
    @item.destroy
    render json: {terminal: "Product has been removed!"}
  end
end
