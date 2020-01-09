require 'comment'

describe Comment do
  let(:db_conn_double){double("")}

  describe '#create' do
    it '- create a new entry in the db' do
      expect(db_conn_double).to receive(:query).with("INSERT INTO comments (text, bookmark_id) VALUES('random_comment', 2);")
      Comment.create(db_conn_double, 'random_comment', 2)
    end
  end
end
