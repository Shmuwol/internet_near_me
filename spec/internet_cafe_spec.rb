require 'spec_helper'

describe InternetNearMe::InternetCafe do
  it 'initializes via a hash' do
    hash = { name: 'Starbucks', website: 'starbucks.com', price: '$$'}
    cafe = InternetNearMe::InternetCafe.new(hash)
    expect(cafe.name).to eq('Starbucks')
    expect(cafe.website).to eq('starbucks.com')
    expect(cafe.price).to eq('$$')
  end

  it 'creates a collection via hashes' do
    hashes = [1, 2, 3].map do |i|
      { name: "Starbucks {i}", website: 'starbucks.com', price: '$$'}
    end
    cafes = InternetNearMe::InternetCafe.create_collection(hashes)
    expect(cafes.size).to eq(3)
    cafes.each.with_index do |cafe, i|
      expect(cafe.name).to eq(hashes[i][:name])
    end
  end
end