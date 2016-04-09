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
  end
end