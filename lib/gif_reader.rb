class GifReader

  def initialize(file_name)
    @stream = File.open(file_name, "rb")
  end

  def execute
    check_file_format
    return get_header_parameters
  end

private

  def check_file_format
    if @stream.read(6) != "GIF89a"
      raise "Input is not a GIF file"
    end
  end

  def get_header_parameters
    parameters = {}

    parameters[:width]            = @stream.read(2).unpack("s").first
    parameters[:height]           = @stream.read(2).unpack("s").first
    parameters[:colors]           = @stream.readbyte
    parameters[:background_color] = @stream.readbyte
    parameters[:ratio]            = @stream.readbyte

    parameters
  end

end
