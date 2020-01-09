require 'pg'

def setup_test_database
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec('DROP TABLE IF EXISTS comments;')
  conn.exec('DROP TABLE IF EXISTS bookmarks;')
  conn.exec('CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title VARCHAR(60), url VARCHAR(60));')
  conn.exec('CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240),
            bookmark_id INTEGER REFERENCES bookmarks (id) ON DELETE CASCADE);')
end
