module FileDb
  class Table
    def initialize(table)
      @table = table
    end

    def select(where: nil)
      return @table unless where

      @table.select { |record| where.to_a.all? { |key, value| record[key.to_s] == value } }
    end
  end
end
