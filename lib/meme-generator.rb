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

  def is_image?
    @source_file = Magick::ImageList.new(@source_filepath)
    !@source_file.nil?
  end

  def generate
    false unless is_image?
    meme = Magick::Draw.new()
    meme.annotate(@source_file, 0, 0, 0, 60, @top_text.upcase) {
      self.gravity = Magick::NorthGravity
      self.pointsize = 52
      self.stroke = 'transparent'
      self.fill = '#ffffff'
      self.font_weight = Magick::BoldWeight
      self.font_family = "Impact"
    }

    meme.annotate(@source_file, 0, 0, 0, 60, @bottom_text.upcase) {
      self.gravity = Magick::SouthGravity
      self.pointsize = 52
      self.stroke = 'transparent'
      self.fill = '#ffffff'
      self.font_weight = Magick::BoldWeight
      self.font_family = "Impact"
    }

    !@source_file.write(@result_filepath).nil?

  end
end