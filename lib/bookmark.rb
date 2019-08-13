require 'pg'

class Bookmark

  def initialize
    @bookmark = bookmark

  end

  def self.all(bridge=PG)
    db = ENV['database']
    #['url1', 'url2', 'url3']
    conn = bridge.connect(dbname: db)
    result = conn.exec("SELECT * FROM bookmarks;")
    result.map{|bookmark| bookmark['url']}
  end



end
