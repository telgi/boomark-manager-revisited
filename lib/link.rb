require 'database_connection'

class Link
  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| link['url'] }
  end

  def self.create(options)
    DatabaseConnection.query("INSERT INTO links (url, title) VALUES ('#{options[:url]}', '#{options[:title]}')")
  end
end
