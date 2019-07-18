require 'pg'

class Bookmark

  if ENV['ENVIRONMENT'] == 'test'
    @connection = PG.connect(dbname: 'bookmark_manager_test')
  else
    @connection = PG.connect(dbname: 'bookmark_manager')
  end

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.list
    result = @connection.exec("SELECT * FROM bookmarks;")
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    result = @connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title;").first
    Bookmark.new(id: result['id'], title: result['title'], url: result['url'])
  end

  def self.delete(id:)
    @connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end
end

