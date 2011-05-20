require          'test/unit'
require_relative '../lib/gif_reader.rb'

class GifReaderTest < Test::Unit::TestCase

  def test_input_wrong_file
    assert_raise RuntimeError do 
      GifReader.new("./test/data/b.jpg").execute
    end
  end

  def test_sample_gif_file
    header_hash = GifReader.new("./test/data/a.gif").execute

    assert_equal 32, header_hash[:width]
    assert_equal 52, header_hash[:height]

    assert_equal "yes", header_hash[:glob_color_tab]
  end

end
