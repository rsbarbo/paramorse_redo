require_relative 'letter_decoder'
require_relative 'queue'

class Decoder

  def decode(morse_code)
    letter_decoder = LetterDecoder.new
    queue = Queue.new
    decoded_word = ""
    morse_code.each_char.with_index do |digit, index|
      queue.push(digit)
      if queue_ends_with_space?(queue)
        encoded_letter = get_next_letter(queue)
      elsif end_of_morse_code_message?(index, morse_code)
        encoded_letter = get_last_letter(queue)
      end
      if encoded_letter
        decoded_word += letter_decoder.decode(encoded_letter)
        queue.clear
      end
    end
    return decoded_word
  end

  def get_last_letter(queue)
    queue.peek(queue.count).join
  end

  def get_next_letter(queue)
    encoded_letter = queue.peek(queue.count - 3).join
  end

  def queue_ends_with_space?(queue)
    queue.count >= 3 && queue.tail(3).join() === "000"
  end

  def end_of_morse_code_message?(index, morse_code)
    morse_code.length - 1 == index
  end

end
