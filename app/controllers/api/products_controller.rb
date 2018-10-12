class Api::ProductsController < ApplicationController
  def nint
    @controller = Product.first
    render "nint.json.jbuilder"
  end
  def snes
    @controller = Product.second
    render "snes.json.jbuilder"
  end
  def cube
    @controller = Product.third
    render "cube.json.jbuilder"
  end
  def all
    @all_products = Product.all
    render "all_products.json.jbuilder"
  end
end
