p "Setting up test database..."

require 'pg'

connection = PG.connect(dbname: 'bookmark_manager_test')

connection.exec("TRUNCATE links;")

connection.exec("INSERT INTO links (url, title) VALUES ('https://www.reddit.com', 'Reddit')")
connection.exec("INSERT INTO links (url, title) VALUES ('https://www.buzzfeed.com', 'Buzzfeed')")
connection.exec("INSERT INTO links (url, title) VALUES ('www.bbc.co.uk/news', 'BBC News')")
