require "./lib/encoder"
require "pry"

module ParaMorse
  class FileEncoder
    attr_reader :encoder

    def initialize
      @encoder = ParaMorse::Encoder.new
    end

    def encode(plain_text, nof = 0, encoded_files)
      input = File.read(plain_text)
      output = encoder.encode(input)
      mutated = mult_files_splitter(output)
      sort_writer(nof, encoded_files, mutated, output)
    end

    def mult_files_splitter(output)
      sorting = output.gsub("0000000", "--").gsub("000", "-").split("-")
      sorting.map! do |string|
        if string.length == 0
          string = "0000000"
        else
          string = string
        end
      end
    end

    def sort_writer(nof, encoded_files, mutated, output)
      file_counter = (0..(nof -1)).to_a
      if encoded_files.include?("*")
        file_breaker(file_counter, nof, mutated)
      else
        File.write(encoded_files, output)
      end
    end

    def file_breaker(file_counter, nof, mutated)
      file_counter.each_with_index do |number, index|
        if index < 10
          File.write("output0#{number}.txt", mutated[index])
        else
          File.write("output#{number}.txt", mutated[index])
        end
      end
    end
    

  end
end

file_enc = ParaMorse::FileEncoder.new
file_enc.encode("plain.txt", 11, "output*.txt")
