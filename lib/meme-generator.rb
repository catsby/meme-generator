require "RMagick"

class MemeGenerator

  attr_reader :source_filepath, :top_text, :bottom_text, :result_filepath

  def initialize(source_filepath, top_text, bottom_text, result_filepath = "mem.jpg")
    @source_filepath  = source_filepath
    @top_text         = top_text
    @bottom_text      = bottom_text
    @result_filepath  = result_filepath
  end

  def file_exist?
    File.file?(@source_filepath)
  end

  def source_file
    @source_file ||= Magick::ImageList.new(@source_filepath)
  end

  def meme
    @meme ||= Magick::Draw.new()
  end

  def generate!
    set_default_meme

    add_text Magick::NorthGravity, top_text
    add_text Magick::SouthGravity, bottom_text
    source_file.write(@result_filepath)
  end

  private

    def set_default_meme
      meme.pointsize = 52
      meme.stroke = 'transparent'
      meme.fill = '#ffffff'
      meme.font_weight = Magick::BoldWeight
      meme.font_family = "Impact"
    end

    def add_text(gravity, text)
      meme.gravity = gravity
      meme.annotate(source_file, 0, 0, 0, 60, text.upcase)
    end
end