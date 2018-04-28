require_relative 'database_connection'
require 'uri'

class Link
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| Link.new(link['id'], link['url'], link['title']) }
  end

  def self.create(options)
    return false unless is_url?(options[:url])
    result = DatabaseConnection.query("INSERT INTO links (url, title) VALUES ('#{options[:url]}', '#{options[:title]}') RETURNING id, url, title")
    Link.new(result[0]['id'], result[0]['url'], result[0]['title'])
  end

  def self.destroy(id)
    DatabaseConnection.query("DELETE FROM links WHERE id = #{id}")
  end

  def self.update(id, options)
    DatabaseConnection.query("UPDATE links SET url = '#{options[:url]}', title = '#{options[:title]}' WHERE id = '#{id}';")
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM links WHERE id = #{id}")
    result.map { |link| Link.new(link['id'], link['url'], link['title']) }.first
  end

  def comments
    result = DatabaseConnection.query("SELECT * FROM comments WHERE link_id = #{@id}")
    result.map { |comment| Comment.new(comment['id'], comment['text']) }
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
