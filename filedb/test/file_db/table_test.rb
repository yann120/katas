require 'test_helper'

class FileDb::TableTest < Minitest::Test
  def setup
    @db = FileDb::Database.new('fixtures/data.json')
    @table = @db.table('movies')
    file = File.read('fixtures/data.json')
    @dataset = JSON.parse(file)
  end

  def test_table_names_returns_an_array
    assert_kind_of(Array, @table.select)
  end

  def test_select_returns_all_the_table_records
    assert_equal @dataset['movies'].length, @table.select.length
  end

  def test_select_where_returns_the_right_record
    assert_equal [@dataset['movies'][1]], @table.select(where: { id: 2 })
  end

  def test_select_where_with_two_params_returns_the_right_record
    assert_equal [@dataset['movies'][3]], @table.select(where: { director_id: 1, year: 1936 })
  end

  def test_select_where_with_params_returns_multiple_matching_records
    assert_equal [@dataset['movies'][0], @dataset['movies'][1], @dataset['movies'][3]], @table.select(where: { director_id: 1 })
  end
end
