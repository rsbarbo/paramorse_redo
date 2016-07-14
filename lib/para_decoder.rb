require "pry"
require "./lib/file_decoder"

module ParaMorse
  class ParallelDecoder
    attr_reader :file_decoder

    def initialize
      @file_decoder = ParaMorse::FileDecoder.new
    end

    def decode_from_file(nof, input_file, output)
      file_decoder.decode(nof, input_file, output)
    end


  end
end
