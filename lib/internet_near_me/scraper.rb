class InternetNearMe::Scraper
  def scrape_by_zip_code(zip_code)
    internet_cafes_hash = [ { name: "Bean & Bean", address: "210-21 Northern Blvd" },
                            { name: "Comma Cafe", address: "12-27 Depot Rd" } ]
    InternetNearMe::InternetCafe.create_collection(internet_cafes_hash)
  end
end