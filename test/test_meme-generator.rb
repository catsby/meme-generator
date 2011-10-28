require 'helper'

class TestMemeGenerator < Test::Unit::TestCase

  def setup
    @generator = MemeGenerator.new("source.jpg", "Top line", "Bottom line", "result.jpg")
  end

  def test_should_create_object
    block = lambda {MemeGenerator.new("source.jpg", "Top line", "Bottom line", "result.jpg")}
    assert_nothing_raised &block
  end

  def test_should_fails_much_args
    block = lambda {MemeGenerator.new("source.jpg", "Top line", "Bottom line", "result.jpg", "Additional argument")}
    assert_raise ArgumentError, &block

  end

  def test_should_fails_too_few_args
    block = lambda {MemeGenerator.new("source.jpg", "Top line")}
    assert_raise ArgumentError, &block
  end
  
  def test_get_source_filepath
    assert_equal "source.jpg", @generator.source_filepath
  end

  def test_get_top_line
    assert_equal "Top line", @generator.top_text
  end

  def test_get_bottom_line
    assert_equal "Bottom line", @generator.bottom_text
  end

  def test_get_result_filepath
    assert_equal "result.jpg", @generator.result_filepath
  end

  def test_default_result_filepath
    generator = MemeGenerator.new("source.jpg", "Top line", "Bottom line")
    assert_equal "mem.jpg", generator.result_filepath
  end

  def test_if_file_exist
    generator = MemeGenerator.new("test/support/image.jpg", "Top line", "Bottom line")
    assert_equal true, generator.file_exist?
  end

  def test_if_file_not_exist
    generator = MemeGenerator.new("not_existing.jpg", "Top line", "Bottom line")
    assert_equal false, generator.file_exist?
  end

  def test_if_file_is_image
    generator = MemeGenerator.new("test/support/image.jpg", "Top line", "Bottom line")
    assert_equal true, generator.is_image?
  end

  def should_fails_if_file_not_image
    generator = MemeGenerator.new("test/support/textfile", "Top line", "Bottom line")
    assert_equal false, generator.is_image?
  end

  def test_should_create_image
    generator = MemeGenerator.new("test/support/image.jpg", "Top line", "Bottom line")
    assert_equal true, generator.generate()
  end
end

