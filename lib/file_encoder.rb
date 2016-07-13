require "./lib/encoder"

module ParaMorse
  class FileEncoder
    attr_reader :encoder

    def initialize
      @encoder = ParaMorse::Encoder.new
    end

    def encode(plain_text, nof = 0, encoded_files)
      input = File.read(plain_text)
      output = encoder.encode(input)
      file_counter = (0..(nof -1)).to_a
      if encoded_files.include?("*")
        file_counter.each_with_index do |number, index|
          if index < 10
            File.write("output0#{n}.txt", output)
          else
            File.write("output#{n}.txt", output)
          end
        end
      else
        File.write(encoded_files, output)
      end
    end

  end
end

  file_enc = ParaMorse::FileEncoder.new
  file_enc.encode("plain.txt", "encoded.txt")
