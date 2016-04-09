class InternetNearMe::CLI
  attr_accessor :zip_code

  def call
    welcome
    get_zip_code
    internet_cafes = list_internet_cafes
    get_more_details(internet_cafes)
  end

  def welcome
    puts "Welcome to internet-near-me!"
  end

  def get_zip_code
    puts "Please enter your zip code:"
    self.zip_code = gets.strip
  end

  def list_internet_cafes
    puts "Internet cafes near #{zip_code}:"
    internet_cafes = InternetNearMe::Scraper.new(zip_code).scrape_by_zip_code
    internet_cafes.each.with_index(1) do |internet_cafe, index| 
      puts "--------------------"
      puts "#{index}."
      puts internet_cafe.name
      puts internet_cafe.address
    end
    puts "--------------------"
    internet_cafes
  end

  def get_more_details(internet_cafes)
    puts "Enter a number to get more details:"
    input = gets.strip
    internet_cafe = InternetNearMe::Scraper.new.scrape_details(internet_cafes[input.to_i - 1])
    puts "--------------------"
    puts internet_cafe.name
    puts "Today: #{internet_cafe.hours}"
    puts internet_cafe.rating
    puts internet_cafe.price
    puts "--------------------"
  end

end