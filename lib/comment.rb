class Comment
  attr_reader :id, :text, :bookmark_id

  def self.create(bridge=DatabaseConnection, text, bookmark_id)
    sql = "INSERT INTO comments (text, bookmark_id) VALUES('#{text}', #{bookmark_id});"
    bridge.query(sql)
  end

  def initialize(id, text, bookmark_id)
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end
end
