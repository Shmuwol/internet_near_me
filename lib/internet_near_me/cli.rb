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
    internet_cafes.each.with_index(1) do |internet_cafe, index| 
      puts "--------------------"
      puts "#{index}."
      puts internet_cafe.name
      puts internet_cafe.address
    end
  end
end