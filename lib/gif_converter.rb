require          "tempfile"  
require          "fileutils"
require_relative "gif_reader.rb"

class GifConverter

  def initialize(file_name)
    @parameters = GifReader.new(file_name).execute
    @file_name = file_name
  end

  def change_colors_to_grey_scale
    check_exist_global_colors_table

    bytes_array = read_all_bytes
    bytes_array = change_colors_table(bytes_array)

    temp = Tempfile.new("temp")
    temp << bytes_array.pack("c*")
    temp.close

    FileUtils.cp(@file_name,"#{@file_name}.bak")
    FileUtils.mv(temp.path, @file_name)
  end

  alias_method :execute, :change_colors_to_grey_scale

private 

  def check_exist_global_colors_table
    if @parameters[:glob_color_tab] == "no"
      raise "Input haven't global colors table"
    end  
  end

  def read_all_bytes
    bytes_array = []
    File.binread(@file_name).each_byte {|b| bytes_array << b}
    bytes_array
  end

  def change_colors_table(bytes_array)
    i = 14                 # if global colors table exist start in 14 byte
    @parameters[:colors].times do 
      pick = bytes_array[i]
      a = i - 1
      bytes_array.fill(pick, a ..a + 2)
      i += 3
    end
    bytes_array
  end
end

