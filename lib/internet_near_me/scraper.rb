class InternetNearMe::Scraper

  REQUEST_HEADERS = { "User-Agent" => "Ruby/#{RUBY_VERSION}", 
                      "From" => "internet-near-me", 
                      "Referer" => "http://www.ruby-lang.org/" }

  def scrape_details(internet_cafe)
    url = "http://www.yelp.com" + internet_cafe.url
    doc = Nokogiri::HTML(open(url, REQUEST_HEADERS))

    internet_cafe.rating = doc.css(".rating-info .star-img").attribute("title")
                              .value.gsub("star rating", "stars")
    internet_cafe.hours = doc.css(".hour-range").text
    internet_cafe
  end

  def scrape_by_zip_code(zip_code)
    url = "http://www.yelp.com/search?find_desc=Internet+Cafes&find_loc=#{zip_code}"
    doc = Nokogiri::HTML(open(url, REQUEST_HEADERS))

    internet_cafe_hashes = doc.css(".search-results-content li.regular-search-result").map do |search_result|
      {
        name: search_result.css("a.biz-name").text.strip,
        address: search_result.css("address").inner_html.gsub("<br>", "\n").strip,
        price: search_result.css(".price-range").text.strip,
        url: search_result.css("a.biz-name").attribute("href").value
      }
    end

    create_internet_cafes(internet_cafe_hashes)
  end

  private

  def create_internet_cafes(internet_cafe_hashes)
    InternetNearMe::InternetCafe.create_collection(internet_cafe_hashes)
  end
end