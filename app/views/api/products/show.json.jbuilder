json.item @item.id
json.controller @item.name
json.price @item.price
json.description @item.description
json.image @item.image_url
json.discount @item.is_discounted?
json.tax @item.tax
json.total @item.total
