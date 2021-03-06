class InternetNearMe::Scraper

  REQUEST_HEADERS = { "User-Agent" => "Ruby/#{RUBY_VERSION}", 
                      "From" => "internet_near_me", 
                      "Referer" => "http://www.ruby-lang.org/" }

  def scrape_details(internet_cafe)
    url = "http://www.yelp.com" + internet_cafe.url
    doc = Nokogiri::HTML(open(url, REQUEST_HEADERS))

    # binding.pry
    internet_cafe.rating = doc.css(".rating-info .star-img").attribute("title")
                              .value.gsub("star rating", "stars")
    internet_cafe.number_of_reviews = doc.css(".rating-info .review-count span").text.strip
    internet_cafe.hours = doc.css(".hour-range").text
    internet_cafe.phone = doc.css(".biz-phone").text.strip
    internet_cafe.website = doc.css(".biz-website a").text.strip
    internet_cafe
  end

  def scrape_by_zip_code(zip_code)
    url = "http://www.yelp.com/search?find_desc=Internet+Cafes&find_loc=#{zip_code}"
    doc = Nokogiri::HTML(open(url, REQUEST_HEADERS))

    internet_cafes = []
    doc.css(".search-results-content li.regular-search-result").map do |search_result|
      internet_cafe = InternetNearMe::InternetCafe.new
      internet_cafe.name = search_result.css("a.biz-name").text.strip
      internet_cafe.address = search_result.css("address").inner_html.gsub("<br>", "\n").strip
      internet_cafe.price = search_result.css(".price-range").text.strip
      internet_cafe.url = search_result.css("a.biz-name").attribute("href").value
      internet_cafes << internet_cafe
    end
    internet_cafes
  end

end