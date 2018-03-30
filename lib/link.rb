require_relative 'database_connection'
require 'uri'

class Link
  attr_reader :url, :title

  def initialize(url, title)
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| Link.new(link['url'], link['title']) }
  end

  def self.create(options)
    return false unless is_url?(options[:url])
    DatabaseConnection.query("INSERT INTO links (url, title) VALUES ('#{options[:url]}', '#{options[:title]}')")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
