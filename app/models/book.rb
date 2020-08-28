class Book < ApplicationRecord
  def price_with_tax
    (price * 1.10r).truncate
  end
end
