class InternetNearMe::CLI
  attr_accessor :zip_code

  def call
    get_zip_code
    list_internet_cafes
  end

  def get_zip_code
    puts "Please enter your zip code:"
    self.zip_code = gets.strip
  end

  def list_internet_cafes
    puts "Internet cafes near #{zip_code}:"
    internet_cafes = InternetNearMe::Scraper.new.scrape_by_zip_code(zip_code)
    internet_cafes.each { |internet_cafe| puts internet_cafe }
  end
end