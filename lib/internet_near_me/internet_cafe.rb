class InternetNearMe::InternetCafe
  attr_accessor :name, :address

  def self.create_collection(internet_cafe_hashes)
    internet_cafe_hashes.map do |internet_cafe_hash| 
      self.new(internet_cafe_hash)
    end
  end

  def initialize(internet_cafe_hash)
    internet_cafe_hash.each do |attribute, value| 
      self.send("#{attribute}=", value)
    end
  end
end