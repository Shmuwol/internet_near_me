require 'spec_helper'

describe InternetNearMe::CLI do
  before do
    @stdout = StringIO.new
    $stdout = @stdout
  end

  it 'lists internet cafes and gets their details' do
    cli = InternetNearMe::CLI.new
    allow(cli).to receive(:gets).and_return("10023", "2", "exit")
    VCR.use_cassette('all') do
      cli.call
      # Lists internet cafes
      expect(@stdout.string).to include('Internet cafes near 10023:')
      expect(@stdout.string).to include('Cafe Noi Espresso Bar')
      expect(@stdout.string).to include("387 Amsterdam Ave\nNew York, NY 10024")

      # Gets their details
      expect(@stdout.string).to include('Irving Farm Coffee Roasters')
      expect(@stdout.string).to include('(212) 874-7979')
      expect(@stdout.string).to include('4.0 stars (355 reviews)')
      expect(@stdout.string).to include('Today: 7:00 am - 10:00 pm')
      expect(@stdout.string).to include('irvingfarm.com')
    end
  end
end