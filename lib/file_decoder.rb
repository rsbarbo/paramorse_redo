require "./lib/decoder"
require "./lib/letter_decoder"
require "./lib/queue"

module ParaMorse
  class FileDecoder
    attr_reader :decoder

#need to make file decoder more dinamic so it can support
#the new feature ParallelDecoder that will demand the data
#to be parsed in a different way (Jul 13th, 3:26 pm)

    def initialize
      @decoder = ParaMorse::Decoder.new
    end

    def decode(encoded_text, plain_text)
      input = File.read(encoded_text)
      output = decoder.decode(input)
      File.write(plain_text, output)
    end
  end
end

file_enc = ParaMorse::FileDecoder.new
file_enc.decode("encoded.txt", "plain.txt")
