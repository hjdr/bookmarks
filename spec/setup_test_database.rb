require 'pg'
require './database_connection.rb'

p 'Setting up database...'

def setup_test_database
  DatabaseConnection.setup( 'bookmark_manager_test')

  DatabaseConnection.query("TRUNCATE bookmarks, comments;")
end
