require 'spec_helper'

describe Product do
  context 'validation' do
       product = Product.new

    it 'is invalid when a name is not supplied' do
      expect(product).to_not be_valid
      expect(product.errors[:name]).to_not be_blank
    end

    it 'is invalid when a price is not supplied' do
      expect(product).to_not be_valid
      expect(product.errors[:price]).to_not be_blank
    end

    it 'is invalied when a price is not a number' do
      product.price = 'foo'
      expect(product).to_not be_valid
      expect(product.errors[:price]).to_not be_blank
    end

    it 'is invalid when a price is negative' do
      product.price = -1
      expect(product).to_not be_valid
      expect(product.errors[:price]).to_not be_blank
    end

    it 'is valid when a price and name is supplied' do
      product.name = 'Commando Frog'
      product.price = 19.99
      expect(product).to_be valid
      expect(product.errors).to be_empty
    end
  end
end
