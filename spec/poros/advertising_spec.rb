require 'rails_helper'

RSpec.describe Advertising do
  describe "#advertising_phrase" do
    it "想定通りの文字列を返すこと" do
      book = Book.create!(title: "RubyBook")
      recommender = User.create!(name: "matz")
      expect(Advertising.phrase(book: book, user: recommender)).to eq("matzも絶賛の新作「RubyBook」！")
    end
  end
end
