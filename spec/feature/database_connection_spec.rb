require './database_connection.rb'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to the database' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup('bookmark_manager_test')
    end

    describe '.query' do
      it 'executes a query to the db' do
        connection = DatabaseConnection.setup('bookmark_manager_test')
        expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
        DatabaseConnection.query("SELECT * FROM bookmarks;")
      end
    end
  end
end
