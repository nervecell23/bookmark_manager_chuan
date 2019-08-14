require 'pg'

class Bookmark

  def initialize
    @bookmark = bookmark

  end

  def self.all(bridge=PG)
    db = ENV['database']
    conn = bridge.connect(dbname: db)
    result = conn.exec("SELECT * FROM bookmarks;")
    result.map{|bookmark| bookmark['url']}
  end

  def self.create(bridge=PG, url)
    db = ENV['database']
    conn = bridge.connect(dbname: db)
    sql = "INSERT INTO bookmarks (url) VALUES('" + url + "');"
    result = conn.exec(sql)
  end





end
