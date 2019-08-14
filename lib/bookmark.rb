require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url

  end

  def self.all(bridge=PG)
    db = ENV['database']
    conn = bridge.connect(dbname: db)
    result = conn.exec("SELECT * FROM bookmarks;")
    result.map{|bookmark| Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])}
  end

  def self.create(bridge=PG, title, url)
    db = ENV['database']
    conn = bridge.connect(dbname: db)

    sql = "INSERT INTO bookmarks (title, url) VALUES('#{title}','#{url}');"

    result = conn.exec(sql)
  end





end
