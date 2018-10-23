json.array! @all_products.each do |product|
  json.partial! "product.json.jbuilder", product: product

end
