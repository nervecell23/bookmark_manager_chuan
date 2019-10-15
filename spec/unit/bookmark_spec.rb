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

  describe '#create' do
    it '- validate the input URL' do
      expect(Bookmark.create('new_title', 'new_url')).to eq(false)
      expect(Bookmark.create('new_title2', 'http://www.a.com')).not_to eq(false)
    end

    it '- add a new url to database' do
      Bookmark.create('random_title', 'http://www.google.com')
      r = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id='1';")
      expect(r[0]['url']).to eq('http://www.google.com')
    end
  end

  describe '#show_comments' do
    it '- fetch comments for a bookmark' do
      bookmark = Bookmark.create('random_title', 'http://www.r1.com')
      DatabaseConnection.query("INSERT INTO comments (text, bookmark_id) VALUES('random_comment', 1);")
      returned_bookmark = Bookmark.all
      expect(returned_bookmark[0].show_comments[0].text).to eq('random_comment')
    end
  end

  describe '#all' do
    it "- connect the psql and return a list of bookmarks" do
      Bookmark.create('test_title1', 'http://www.test1.com')
      Bookmark.create('test_title2', 'http://www.test2.com')
      expect(Bookmark.all[0].title).to eq('test_title1')
      expect(Bookmark.all[0].url).to eq('http://www.test1.com')
      expect(Bookmark.all[1].title).to eq('test_title2')
      expect(Bookmark.all[1].url).to eq('http://www.test2.com')
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
