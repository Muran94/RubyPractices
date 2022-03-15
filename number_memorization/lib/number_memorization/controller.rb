module NumberMemorization
  class Controller
    class UnavailableDigitsError < StandardError; end
    class UnavailableSecondsError < StandardError; end

    AVAILABLE_DIGITS = [10, 20, 30, 40, 50, 60].freeze
    AVAILABLE_SECONDS = [10, 20, 30, 40, 50, 60].freeze

    attr_accessor :digits, :seconds, :generated_numbers, :answered_numbers, :correct_count

    def initialize
      @correct_count = 0
    end

    def select_digits
      begin
        puts 'Choose digits from bellow and enter the value.'
        puts AVAILABLE_DIGITS.join(", ")
        print '=> '

        inputted_digits = gets.chomp.to_i
        raise UnavailableDigitsError unless AVAILABLE_DIGITS.include?(inputted_digits)

        self.digits = inputted_digits

      rescue UnavailableDigitsError => e
        retry
      end
    end

    def select_seconds
      begin
        puts 'Choose seconds from bellow and enter the value.'
        puts AVAILABLE_SECONDS.join(", ")
        print '=> '

        inputted_seconds = gets.chomp.to_i
        raise UnavailableSecondsError unless AVAILABLE_SECONDS.include?(inputted_seconds)

        self.seconds = inputted_seconds

      rescue UnavailableSecondsError => e
        retry
      end
    end

    def generate_numbers_and_show
      puts "Remember numbers shown bellow. You have #{seconds} seconds to remember..."
      
      self.generated_numbers =
        Array.new(digits).map do |n|
          (0..9).to_a.sample
        end
      
      numbers_splitted_by_10_digits = _numbers_splitted_by_10_digits(generated_numbers)

      print %(#{numbers_splitted_by_10_digits}\r)

      sleep 2

      puts numbers_splitted_by_10_digits.gsub(/\d/, "◯")
    end

    def answer_numbers
      puts "Answer the numbers."
      print '=> '

      self.answered_numbers = gets.chomp.gsub(" ", "").chars.map(&:to_i)
    end

    def show_results
      puts "Here are the correct numbers."
      puts _numbers_splitted_by_10_digits(generated_numbers)
      puts "\n"

      puts "Here are your the numbers you answered."
      puts _numbers_splitted_by_10_digits(answered_numbers)
      puts "\n"

      _judge_result
      _show_results
    end

    private

    def _numbers_splitted_by_10_digits(numbers_array)
      numbers_splitted_by_10_digits = []

      numbers_array.each_slice(10) do |numbers|
        numbers_splitted_by_10_digits << numbers.join
      end

      numbers_splitted_by_10_digits.join(" ")
    end

    def _judge_result
      digits.times do |i|
        self.correct_count += 1 if generated_numbers[i] == answered_numbers[i]
      end
    end

    def _show_results
      puts %(#{correct_count}/#{digits}(#{(correct_count.fdiv(digits) * 100).round}%))
    end
  end
end