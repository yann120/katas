require 'json'

module FileDb
  class Database
    def initialize(data_file)
      file = File.read(data_file)
      @data_file = JSON.parse(file)
    end

    def table_names
      @data_file.keys.sort
    end

    def table(name)
      FileDb::Table.new(@data_file[name])
    end
  end
end
