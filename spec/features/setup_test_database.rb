require 'pg'

def setup_test_database
  conn = PG.connect(dbname: ENV['database'])

  conn.exec('TRUNCATE bookmarks RESTART identity;')




  conn.close
end
