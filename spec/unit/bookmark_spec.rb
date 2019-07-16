require './app/models/bookmark.rb'

describe Bookmark do

  describe "#list" do
    it "displays the list of saved bookmarks" do
      expect(Bookmark.list).to include('http://www.google.com')
    end
  end
end