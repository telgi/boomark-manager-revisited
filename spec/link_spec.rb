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
      Link.create(id: 4, url: 'https://www.theguardian.com/', title: 'Guardian')
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

  describe '.delete' do
    it 'deletes a link' do
      Link.destroy(1)
      links = Link.all
      urls = links.map(&:url)
      expect(urls).not_to include 'https://www.reddit.com'
    end
  end

  describe '.update' do
    it 'updates a link' do
      Link.update(1, url: 'https://www.breddit.com', title: 'Breddit')
      links = Link.all
      urls = links.map(&:url)
      titles = links.map(&:title)

      expect(urls).not_to include 'https://www.reddit.com'
      expect(titles).not_to include 'reddit'
      expect(urls).to include 'https://www.breddit.com'
      expect(titles).to include 'Breddit'
    end
  end

  describe '.find' do
    it 'finds a link by id' do
      link = Link.find(1)

      expect(link.url).to eq 'https://www.reddit.com'
      expect(link.title).to eq 'Reddit'
    end
  end
end
