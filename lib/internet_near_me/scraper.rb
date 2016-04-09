class InternetNearMe::Scraper
  attr_accessor :zip_code

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def scrape_by_zip_code
    url = "http://www.yelp.com/search?find_desc=Internet+Cafes&find_loc=#{zip_code}"
    doc = Nokogiri::HTML(open(url, "User-Agent" => "Ruby/#{RUBY_VERSION}", 
                                   "From" => "internet-near-me", 
                                   "Referer" => "http://www.ruby-lang.org/"))
    # binding.pry

    internet_cafe_hashes = doc.css(".search-results-content li.regular-search-result").map do |search_result|
      {
        name: search_result.css("a.biz-name").text,
        address: search_result.css("address").text
      }
    end

    create_internet_cafes(internet_cafe_hashes)
  end

  def create_internet_cafes(internet_cafe_hashes)
    InternetNearMe::InternetCafe.create_collection(internet_cafe_hashes)
  end
end