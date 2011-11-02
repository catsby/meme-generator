require 'meme_generator'

class ConsoleGenerator
  def initialize(args)
    @args = args
  end

  def run!
    if @args.count < 3
      puts "Usage: ./#{File.basename( __FILE__)} <source file path> <top text line> <bottom text line> (optional: <result file path>)"
      return
    end

    meme_generator.generate!
  end

  def meme_generator
    MemeGenerator.new(*@args)
  end


end

