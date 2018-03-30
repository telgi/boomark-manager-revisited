require 'link'

describe Link do

  let(:link) { described_class.new }

  describe '.all' do
    it 'returns all links' do
      links = Link.all

      expect(links).to include('https://www.reddit.com')
      expect(links).to include('https://www.buzzfeed.com')
      expect(links).to include('www.bbc.co.uk/news')
    end
  end
end
