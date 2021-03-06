require_relative './comment.rb'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url

  end

  def self.all
    # db = ENV['database']
    # conn = bridge.connect(dbname: db)
    # result = conn.exec("SELECT * FROM bookmarks;")
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map{|bookmark| Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])}
  end

  def self.create(title, url)
    # db = ENV['database']
    # conn = bridge.connect(dbname: db)
    if url =~ /\A#{URI::regexp(['http', 'https'])}\z/
      sql = "INSERT INTO bookmarks (title, url) VALUES('#{title}','#{url}');"
      # result = conn.exec(sql)
      result = DatabaseConnection.query(sql)
    else
      false
    end
  end

  def delete
    sql = "DELETE FROM bookmarks WHERE id=#{@id}"
    result = DatabaseConnection.query(sql)
  end

  def self.update(bridge=PG, id, modified_title, modified_url)
    # db = ENV['database']
    # conn = bridge.connect(dbname: db)
    sql = "UPDATE bookmarks SET title='#{modified_title}', url='#{modified_url}' WHERE id=#{id};"
    # result = conn.exec(sql)
    result = DatabaseConnection.query(sql)
  end

  def self.find(bridge=PG, id)
    # db = ENV['database']
    # conn = bridge.connect(dbname: db)
    sql = "SELECT * FROM bookmarks WHERE id=#{id};"
    result = DatabaseConnection.query(sql)
    # result = conn.exec(sql)
    result.map{|bookmark| Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])}
  end

  def show_comments
    sql = "SELECT * FROM comments WHERE bookmark_id=#{@id};"
    result = DatabaseConnection.query(sql)
    result.map{|element|
      Comment.new(element['id'], element['text'], element['bookmark_id'])
      #will return an array of Comment obj
    }
  end

end
