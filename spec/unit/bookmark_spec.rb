require './app/models/bookmark.rb'

describe Bookmark do

  describe "#list" do
    it "displays the list of saved bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
      bookmarks = Bookmark.list
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe "#create" do
    context "when a user adds a bookmark" do
      it "saves it to the database" do
        Bookmark.create(url: 'www.cockandballs.com')
        expect(Bookmark.list).to include('www.cockandballs.com')
      end
    end
  end
end
