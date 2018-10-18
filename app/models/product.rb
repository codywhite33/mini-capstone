class Product < ApplicationRecord
  def is_discounted?
    x = false
    if price < 10
      x = true
    end
    return x
  end
  def tax
    tax = price.to_i * 0.09
    return tax.round(3)
  end
  def total
    final = price.to_i + tax
    return '%.2f' % final
  end
end
