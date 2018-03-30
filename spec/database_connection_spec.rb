require 'database_connection'

RSpec.describe DatabaseConnection do
  describe '#.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '#.connection' do
    it 'ensures the connection is persistent' do
      connection = DatabaseConnection.setup('bookmark_manager_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '#.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('bookmark_manager_test')

      expect(connection).to receive(:exec).with("SELECT * FROM links;")
      DatabaseConnection.query("SELECT * FROM links;")
    end
  end
end
