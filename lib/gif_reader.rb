class GifReader

  COLOR_PALETTE = [2, 4, 8, 16, 32, 64, 128, 256]

  def initialize(file_name)
    @stream = File.open(file_name, "rb")
    check_file_format
  end

  def get_header_parameters
    parameters = {}

    parameters[:width]            = read_int16
    parameters[:height]           = read_int16

    bits_table = read_bits_from_byte
    parameters[:glob_color_tab]   = bits_table.first == "1" ? "yes" : "no"
    parameters[:colors]           = get_color_table_size(bits_table)
    
    parameters[:background_color] = @stream.readbyte

    if parameters[:glob_color_tab] == "no"
      parameters[:ratio]          = @stream.readbyte 
    end
  
    return parameters
  end

  alias_method :execute, :get_header_parameters

private

  def check_file_format
    if @stream.read(6) != "GIF89a"
      raise "Input is not a GIF file"
    end
  end

  def read_int16
    @stream.read(2).unpack("s").first
  end

  def read_bits_from_byte
    byte = @stream.readbyte.to_s(2)
    bits = byte.split("")
  end

  def get_color_table_size(bits_table)
    three_bits =  bits_table[1..3].join
    COLOR_PALETTE[three_bits.to_i(2)]
  end

end
