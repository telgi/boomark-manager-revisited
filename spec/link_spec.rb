require 'link'

describe Link do
  describe '.all' do
    it 'returns all links' do
      links = Link.all

      expect(links).to include('https://www.reddit.com')
      expect(links).to include('https://www.buzzfeed.com')
      expect(links).to include('www.bbc.co.uk/news')
    end
  end

  describe '.create' do
    it 'creates a new link' do
      Link.create(url: 'https://www.theguardian.com/', title: 'Guardian')

      expect(Link.all).to include 'https://www.theguardian.com/'
    end
  end
end
