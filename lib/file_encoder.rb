require "./lib/paramorse"

module ParaMorse

  class FileEncoder

    attr_reader :encoder

    def initialize
      @encoder = ParaMorse::Encoder.new
    end

    def encode(plain_text, encoded_text)
      input = File.read(plain_text)
      output = encoder.encode(input)
      File.write(encoded_text, output)
    end
  end

end

file_enc = ParaMorse::FileEncoder.new
file_enc.encode("plain.txt", "encoded.txt")
