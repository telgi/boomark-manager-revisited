require 'link'

describe Link do
  describe '.all' do
    it 'returns all links, wrapped in link instances' do
      links = Link.all
      urls = links.map(&:url)

      expect(urls).to include('https://www.reddit.com')
      expect(urls).to include('https://www.buzzfeed.com')
      expect(urls).to include('www.bbc.co.uk/news')
    end
  end

  describe '.create' do
    it 'creates a new link' do
      Link.create(url: 'https://www.theguardian.com/', title: 'Guardian')
      links = Link.all
      urls = links.map(&:url)
      expect(urls).to include 'https://www.theguardian.com/'
    end

    it 'does not create a new link if the URL is invalid' do
      Link.create(url: 'ww.fake-news.co', title: 'Fake News')
      links = Link.all
      urls = links.map(&:url)
      expect(urls).not_to include 'ww.fake-news.co'
    end
  end
end
