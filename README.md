# GifTool

gem to read and convert gif format data

## Instruction

class GifReader

	method "header_parameters" get header data: 
	
		-width and height,
		
		-existance global colors table,
		
		-colors pallette(2, 4, 8, 16, 32, 64, 128 or 256 colors)
		
		-background color
		
		-ratio


class GifConverter

		method "to_grey_scale" change image collors to grey scale( Gif file must has global color table)

## Examples

to read headers parameters:

		gif_reader = GifTool::GifReader.new("path/to/file")
		header_parameters = gif_reader.header_parameters

or convert image to grey scale:

		gif_converter = GifTool::GifConverter.new("path/to/file")
		gif_converter.to_grey_scale("path/to/new_file")

