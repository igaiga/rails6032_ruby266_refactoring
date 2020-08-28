require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "#advertising_phrase" do
    it "想定通りの文字列を返すこと" do
      book = Book.create!(title: "RubyBook")
      recommender = User.build(name: "matz")
      p book.advertising_phrase(recommender)
    end
  end
end
