require 'database_connection'

describe DatabaseConnection do

  let(:pg_double){double("PG")}
  let(:pg_conn_double){double("conn")}

  describe '#setup' do
    it '- create a new connection' do
      expect(pg_double).to receive(:connect).with({dbname: 'bookmark_manager_test'})
      DatabaseConnection.setup(pg_double, 'bookmark_manager_test')
    end
  end

  describe '#query' do
    it '- send SQL query to db' do
      allow(pg_double).to receive(:connect).and_return(pg_conn_double)
      expect(pg_conn_double).to receive(:exec).with('a random sql query')
      DatabaseConnection.setup(pg_double, 'bookmark_manager_test')
      DatabaseConnection.query('a random sql query')
    end
  end 


end
