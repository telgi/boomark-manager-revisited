require 'pg'
require_relative 'lib/database_connection'

task default: %w[test_database_setup]

task :setup do
  p 'Creating databases...'
  connection = PG.connect
  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection.exec("CREATE DATABASE #{database};")
    DatabaseConnection.setup("#{database}")
    DatabaseConnection.query("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));")
  end
end

task :test_database_setup do
  DatabaseConnection.setup('bookmark_manager_test')
  DatabaseConnection.query("TRUNCATE links;
  INSERT INTO links (id, url, title) VALUES (1, 'https://www.reddit.com', 'Reddit');
  INSERT INTO links (id, url, title) VALUES (2, 'https://www.buzzfeed.com', 'Buzzfeed');
  INSERT INTO links (id, url, title) VALUES (3, 'www.bbc.co.uk/news', 'BBC News');")
end
