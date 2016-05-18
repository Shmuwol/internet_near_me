class InternetNearMe::CLI
  attr_accessor :zip_code, :exit

  def call
    welcome
    loop do
      if !exit
        get_zip_code
        exit ? break : get_more_details(list_internet_cafes)
      else
        break
      end
    end
    goodbye
  end

  def welcome
    puts "Welcome to internet_near_me! Enter 'exit' at any time to exit."
    self.exit = false 
  end

  def goodbye
    puts "Goodbye!"
  end

  def get_zip_code
    puts "Please enter your zip code:"
    input = gets.strip
    if input == 'exit'
      self.exit = true
    else
      self.zip_code = input
    end
  end

  def list_internet_cafes
    puts "Internet cafes near #{zip_code}:"
    internet_cafes = InternetNearMe::Scraper.new.scrape_by_zip_code(zip_code)
    internet_cafes.each.with_index(1) do |internet_cafe, index| 
      render_divider
      puts "#{index}."
      puts internet_cafe.name
      puts internet_cafe.address
    end
    render_divider
    internet_cafes
  end

  def get_more_details(internet_cafes)
    loop do
      puts "Enter a number to get more details or 'back' to enter a new zip code:"
      input = gets.strip
      if input == 'back'
        break
      elsif input == 'exit'
        self.exit = true
        break
      else
        internet_cafe = InternetNearMe::Scraper.new.scrape_details(internet_cafes[input.to_i - 1])
        render_divider
        puts internet_cafe.name
        puts internet_cafe.phone
        puts "Today: #{internet_cafe.hours}"
        puts "#{internet_cafe.rating} (#{internet_cafe.number_of_reviews} reviews)"
        puts internet_cafe.price
        puts internet_cafe.website
        render_divider
      end
    end
  end

  private

  def render_divider
    puts "--------------------"
  end

end