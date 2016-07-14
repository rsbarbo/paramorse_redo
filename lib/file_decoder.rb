require "./lib/decoder"
require "./lib/letter_decoder"
require "./lib/queue"

module ParaMorse
  class FileDecoder
    attr_reader :decoder

    def initialize
      @decoder = ParaMorse::Decoder.new
    end

    def decode(nof, encoded_text, plain_text)
      input = File.read(encoded_text)
      output = decoder.decode(input)
      File.write(plain_text, output)
    end
    
  end
end

file_enc = ParaMorse::FileDecoder.new
file_enc.decode(1, "encoded.txt", "plain.txt")
