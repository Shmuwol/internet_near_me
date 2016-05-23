require 'spec_helper'

describe InternetNearMe::Scraper do
  it 'scrapes by zip code' do
    VCR.use_cassette('zip_code') do 
      cafes = InternetNearMe::Scraper.new.scrape_by_zip_code(10023)
      cafe = cafes[0]
      expect(cafe.name).to eq('Cafe Noi Espresso Bar')
      expect(cafe.address).to eq("387 Amsterdam Ave\nNew York, NY 10024")
      expect(cafe.price).to eq('$$')
      expect(cafe.url).to eq('/biz/cafe-noi-espresso-bar-new-york')
    end
  end

  it 'scrapes details' do
    cafe = InternetNearMe::InternetCafe.new
    cafe.name = 'Irving Farm Coffee Roasters'
    cafe.address = "224 W 79th St\nNew York, NY 10024"
    cafe.price = '$$'
    cafe.url = '/biz/irving-farm-coffee-roasters-new-york-2'
    VCR.use_cassette('details') do
      detailed_cafe = InternetNearMe::Scraper.new.scrape_details(cafe)
      expect(detailed_cafe.rating).to eq('4.0 stars')
      expect(detailed_cafe.number_of_reviews).to eq('355')
      expect(detailed_cafe.hours).to eq('7:00 am - 10:00 pm')
      expect(detailed_cafe.phone).to eq('(212) 874-7979')
      expect(detailed_cafe.website).to eq('irvingfarm.com')
    end
  end
end