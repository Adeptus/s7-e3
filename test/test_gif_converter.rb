require          'test/unit'
require          'fileutils'
require_relative '../lib/GifTool/gif_converter.rb'

class GifConverterTest < Test::Unit::TestCase

  def test_input_wrong_file
    assert_raise RuntimeError do 
      Giftool::GifConverter.new("./test/data/b.jpg").to_grey_scale("b.bw.jpg")
    end
  end

  def test_change_palette_to_gray_scale
    file = Giftool::GifConverter.new("./test/data/smurfs.gif")
		file.to_grey_scale("./test/data/smurfs.bw.gif")

    assert_equal true, File.exists?("./test/data/smurfs.bw.gif")

		FileUtils.remove_file("./test/data/smurfs.bw.gif")
  end
end
