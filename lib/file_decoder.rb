require "./lib/decoder"
require "./lib/letter_decoder"
require "./lib/queue"

module ParaMorse
  class FileDecoder
    attr_reader :decoder, :file_counter, :incoming_text, :send_to_file

    def initialize
      @decoder = ParaMorse::Decoder.new
      @incoming_text = []
    end

    def decode(nof, encoded_text, plain_text)
      file_counter = (0..(nof -1)).to_a
      input = file_reading(file_counter, nof)
      remove_zeros(incoming_text)
      output = decoder.decode(input)
      File.write(plain_text, output)
    end

    def file_reading(file_counter, nof)
      file_counter.each_with_index do |number, index|
        if index >= 10
          incoming_text << File.read("output#{number}.txt")
        else
          incoming_text << File.read("output0#{number}.txt")
        end
      end
    end

    def remove_zeros(input)
      trpl_zero_rmvd = input.map do |string|
        string.split("000")
      end
      parser(trpl_zero_rmvd)
    end

    def parser(trpl_zero_rmvd)
      counter = trpl_zero_rmvd.first.count
      parsed = trpl_zero_rmvd.map do |array|
        if array.length < counter
          array.push("nil")
        else
          array
        end
      end
      outcome = parsed.transpose
      nil_remover(outcome)
    end

    def nil_remover(outcome)
      eliminator = outcome.map do |pre_trans|
        if pre_trans.include?("nil") || pre_trans.include?(nil)
          pre_trans.delete(pre_trans)
        else
          pre_trans
        end
      end
      eliminator.pop
      space_remover(eliminator)
    end

    def space_remover(eliminator)
      space_removed = eliminator.map do |nested|
        nested.map do |string|
          if string.include?("")
            string.gsub!("", "0")
          else
            string
          end
        end
      end
      pre_translator_to_english(space_removed)
    end

    def pre_translator_to_english(space_removed)
      pre_english = space_removed.map do |nested|
        nested.map do |string|
          if ((string[0] == "0") && (string[-1] == "0"))
            string.slice!(0) && string.slice!(-1)
            elsif string[0] == "0"
            string.slice!(0)
          elsif  string[-1] == "0"
          string.slice!(-1)
        else
          string
        end
          decoder.decode(string)
        end
      end
    end

  end
end


file_enc = ParaMorse::FileDecoder.new
file_enc.decode(11, "encoded.txt", "plain.txt")
