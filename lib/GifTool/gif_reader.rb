module Giftool
	class GifReader

		def initialize(file_name)
		  @stream = File.open(file_name, "rb")
		  check_file_format
		end

		def header_parameters
			@headers ||= @stream
		  parameters = {}

		  parameters[:width]            = read_int16
		  parameters[:height]           = read_int16

		  bits_table = read_bits_from_byte
		  parameters[:glob_color_tab]   = bits_table.first == "1" ? true : false
		  parameters[:colors]           = color_table_size(bits_table)
		  
		  parameters[:background_color] = @headers.readbyte

		  if parameters[:glob_color_tab] == false
		    parameters[:ratio]          = @headers.readbyte 
		  end
		
		  parameters
		end

	private

		def check_file_format
		  if @stream.read(6) != "GIF89a"
		    raise "Input is not a GIF file"
		  end
		end

		def read_int16
		  @headers.read(2).unpack("s").first
		end

		def read_bits_from_byte
		  byte = @headers.readbyte.to_s(2)
		  byte.split("")
		end

		def color_table_size(bits_table)
		  three_bits =  bits_table[1..3].join
		  return 2 ** (three_bits.to_i(2) + 1)
		end

	end
end
