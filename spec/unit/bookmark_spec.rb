require './app/models/bookmark.rb'
require 'database_helpers'

describe Bookmark do

  describe ".list" do
    it "displays the list of saved bookmarks" do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: "Makers Academy")
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: "Destroy Software")
      Bookmark.create(url: 'http://www.google.com', title: "Google")
      bookmarks = Bookmark.list
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe ".create" do
    context "when a user adds a bookmark" do
      it "saves it to the database" do
        bookmark = Bookmark.create(url: 'http://www.cockandballs.com', title: 'Chicken Tennis')
        persisted_data = persisted_data(id: bookmark.id)

        expect(bookmark).to be_a Bookmark
        expect(bookmark.id).to eq persisted_data['id']
        expect(bookmark.url).to eq 'http://www.cockandballs.com'
        expect(bookmark.title).to eq 'Chicken Tennis'
      end
    end

    context "when a user adds an incorrect url" do
      it "displays an error message" do
        Bookmark.create(url: 'www.incorrect-url', title: 'Incorrect URL')
        expect(Bookmark.list).not_to include 'Incorrect URL'
      end
    end
  end

  describe ".delete" do
    context "when a user deletes a bookmark" do
      it "deletes it from the database" do
        bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
        Bookmark.delete(id: bookmark.id)
        expect(Bookmark.list).to be_empty
      end
    end
  end

  describe ".update" do
    it "updates the bookmark with the given data" do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'https://www.makersacademy.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'https://www.snakersacademy.com', title: 'Snakers Academy')

     expect(updated_bookmark).to be_a Bookmark
     expect(updated_bookmark.id).to eq bookmark.id
     expect(updated_bookmark.title).to eq 'Snakers Academy'
     expect(updated_bookmark.url).to eq 'https://www.snakersacademy.com'
    end
  end

  describe ".find" do
    it "returns the requested bookmark object" do
      bookmark = Bookmark.create(title: 'Makers', url: 'https://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers'
      expect(result.url).to eq 'https://www.makersacademy.com'
    end
  end
end
