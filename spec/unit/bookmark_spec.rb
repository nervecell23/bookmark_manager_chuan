#
require 'bookmark'
describe Bookmark do
  let(:pg_double){double("PG")}
  let(:connection_double){double("connection")}

  before(:each) do
    rslt = [
      {'url' => 'http://www.makersacademy.com'},
      {'url' => 'http://www.google.com'},
      {'url' => 'http://www.twitter.com'}
    ]

    allow(pg_double).to receive(:connect).and_return(connection_double)
    allow(connection_double).to receive(:exec).and_return(rslt)
  end

  it "has attribute id, title and url" do
    random_bookmark = Bookmark.new(1, 'random_title', 'random_url')
    expect(random_bookmark).to respond_to(:id)
    expect(random_bookmark).to respond_to(:title)
    expect(random_bookmark).to respond_to(:url)
  end

  # describe '#all' do
  #   it "- connect the psql and return a list of bookmarks" do
  #     target = ['http://www.makersacademy.com', 'http://www.google.com', 'http://www.twitter.com']
  #     expect(Bookmark.all(pg_double)).to eq(target)
  #   end
  # end

  describe '#create' do
    it '- add a new url to database' do
      expect(pg_double).to receive(:connect).and_return(connection_double)
      expect(connection_double).to receive(:exec).with("INSERT INTO bookmarks (title, url) VALUES('random_title','http://www.google.com');")


      Bookmark.create(pg_double, 'random_title', 'http://www.google.com')
    end
  end

  describe '#delete' do
    it '- delete an entry in the database' do
      expect(pg_double).to receive(:connect).and_return(connection_double)
      expect(connection_double).to receive(:exec).with("DELETE FROM bookmarks WHERE id=random_id;")
      Bookmark.delete(pg_double, 'random_id')
    end
  end

  describe '#update' do
    it 'update an entry in db by its id' do
      expect(pg_double).to receive(:connect).and_return(connection_double)
      expect(connection_double).to receive(:exec).with("UPDATE bookmarks SET title='modified_title', url='modified_url' WHERE id=1;")
      Bookmark.update(pg_double, 1, 'modified_title', 'modified_url')
    end
  end

  describe '#find' do
    it 'fetch an entry from db' do
      expect(pg_double).to receive(:connect).and_return(connection_double)
      expect(connection_double).to receive(:exec).with("SELECT * FROM bookmarks WHERE id=1;")
      Bookmark.find(pg_double, 1)
    end
  end


end
