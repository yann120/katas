require 'test_helper'

class FileDb::DatabaseTest < Minitest::Test
  def setup
    @db = FileDb::Database.new('fixtures/data.json')
  end

  def test_table_names_returns_an_array
    assert_kind_of(Array, @db.table_names)
  end

  def test_table_names_returns_table_name
    assert_equal(['directors', 'movies'], @db.table_names)
  end

  def test_table_returns_a_file_db_table_instance
    assert_kind_of(FileDb::Table, @db.table('movies'))
  end
end
