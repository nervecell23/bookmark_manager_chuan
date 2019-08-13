#
require 'bookmark'
describe Bookmark do
  let(:pg_double){double("PG")}
  let(:connection_double){double("connection")}

  describe '#all' do
    it "connect the psql and return a list of bookmarks" do
      rslt = [
        {'url' => 'http://www.makersacademy.com'},
        {'url' => 'http://google.com'},
        {'url' => 'http://www.twitter.com'}
      ]

      target = ['http://www.makersacademy.com', 'http://google.com', 'http://www.twitter.com']

      allow(pg_double).to receive(:connect).and_return(connection_double)
      allow(connection_double).to receive(:exec).and_return(rslt)
      expect(Bookmark.all(pg_double)).to eq(target)
    end
  end
end
