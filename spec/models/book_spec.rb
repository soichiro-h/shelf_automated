require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'book validation' do
    subject(:book) { Book.new(title: 'a' * 10, price: 1500) }

    it 'valid book' do
      expect(book).to be_valid
    end

    it 'invalid title (blank)' do
      book.title = ' '
      expect(book).not_to be_valid
    end

    it 'invalid price (not integer)' do
      book.price = 'aaa'
      expect(book).not_to be_valid
    end
    
  end
end