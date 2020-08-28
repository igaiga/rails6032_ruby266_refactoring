class Book < ApplicationRecord
  def price_with_tax
    (price * 1.10r).truncate
  end

  def advertising_phrase(recommender)
    "#{recommender.name}も絶賛の新作「#{title}」！"
  end
end
