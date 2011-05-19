require 'test/unit'
require './lib/gif_reader.rb'

class GifReaderTest < Test::Unit::TestCase

  def test_input_wrong_file
    assert_raise RuntimeError do 
      GifReader.new("./data/b.jpg").execute
    end
  end

  def test_sample_gif_file
    header_hash = GifReader.new("./data/a.gif").execute
    assert_equal 32, header_hash[:width]
  end

end
