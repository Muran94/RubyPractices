require './lib/number_memorization/controller'

module NumberMemorization
  class App
    def initialize
    end

    def play(&block)
      if block_given?
        controller = NumberMemorization::Controller.new

        yield controller
      end
    end
  end
end