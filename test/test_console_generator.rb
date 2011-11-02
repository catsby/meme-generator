require 'helper'
require 'console_generator'

class MyTest < Test::Unit::TestCase
  def test_should_generate_3_args
    console = ConsoleGenerator.new( ['test/support/image.jpg', 'Top line', 'Bottom line'])
    console.run!

    assert_equal true, FileUtils.compare_file("mem.jpg", "test/support/result.jpg")

    File.delete("mem.jpg")
  end

  def test_should_generate
    console = ConsoleGenerator.new( ['test/support/image.jpg', 'Top line', 'Bottom line', 'test/support/temporary.jpg'])
    console.run!

    assert_equal true, FileUtils.compare_file("test/support/temporary.jpg", "test/support/result.jpg")

    File.delete("test/support/temporary.jpg")
  end
end