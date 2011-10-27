class MemeGenerator

  attr_reader :source_filepath, :top_text, :bottom_text, :result_filepath

  def initialize(source_filepath, top_text, bottom_text, result_filepath = "mem.jpg")
    @source_filepath  = source_filepath
    @top_text         = top_text
    @bottom_text      = bottom_text
    @result_filepath  = result_filepath
  end
end