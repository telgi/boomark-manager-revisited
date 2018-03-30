require 'pg'

task default: %w[test_database_setup]

task :test_database_setup do
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE links;")
  connection.exec("INSERT INTO links (url, title) VALUES ('https://www.reddit.com', 'Reddit')")
  connection.exec("INSERT INTO links (url, title) VALUES ('https://www.buzzfeed.com', 'Buzzfeed')")
  connection.exec("INSERT INTO links (url, title) VALUES ('www.bbc.co.uk/news', 'BBC News')")
end

task :setup do
  p 'Creating databases...'
  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: "#{database}")
    connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));")
  end
end
