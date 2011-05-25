# GifTool

gem to read and convert gif format data

## Examples

to read headers parameters:

		gif_reader = Giftool::GifReader.new("path/to/file")
		header_parameters = gif_reader.header_parameters

or convert image to grey scale:

		gif_converter = Giftool::GifConverter.new("path/to/file")
		gif_converter.to_grey_scale("path/to/new_file")		
		
