require './app/models/bookmark.rb'

describe Bookmark do

  describe "#list" do
    it "displays the list of saved bookmarks" do
      expect(Bookmark.list).to eq(["cock and balls"])
    end
  end
end