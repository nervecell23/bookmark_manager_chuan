require 'pg'

class DatabaseConnection


  def self.setup(bridge=PG, db_name)
    @connection_obj = bridge.connect(dbname: db_name)
  end

  def self.query(sql)
    @connection_obj.exec(sql)
  end
end
