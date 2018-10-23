class Api::ProductsController < ApplicationController

  def index
    search = params[:search]
    @all_products = Product.all.order(:id)
    if search
      @all_products = Product.where("name ilike ?", "%#{search}%")
      @all_products = @all_products.order(:price)
    end
    
    render "index.json.jbuilder"
  end
  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jbuilder"
  end
  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      supplier_id: params["supplier_id"]
      )
    if @product.save
      render "show.json.jbuilder"
    else 
      render json: {error: @product.errors.full_messages}, status: 422
    end
  end
  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params["name"] || @product.name
    @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description
    @product.price = params["price"] || @product.price
    @product.supplier_id = params["supplier_id"] || @product.supplier_id

    if @product.save
      render "show.json.jbuilder"
    else 
      render json: {error: @product.error.all_messages}, status: 422
    end
  end
  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {terminal: "Product has been removed!"}
  end
end
