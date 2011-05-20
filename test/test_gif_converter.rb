require          'test/unit'
require_relative '../lib/gif_converter.rb'

class GifConverterTest < Test::Unit::TestCase

  def test_input_wrong_file
    assert_raise RuntimeError do 
      GifConverter.new("./test/data/b.jpg").execute
    end
  end

  def test_change_palette_to_gray_scale
    GifConverter.new("./test/data/smurfs.gif").execute

    assert_equal true, File.exists?("./test/data/smurfs.gif.bak")
  end

end
