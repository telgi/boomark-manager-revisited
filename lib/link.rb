require 'pg'

class Link
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
      result = connection.exec("SELECT * FROM links")
      result.map { |link| link['url'] }
  end
end
