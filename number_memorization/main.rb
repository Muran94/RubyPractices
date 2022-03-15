require './lib/number_memorization/app'

app = NumberMemorization::App.new

app.play do |controller|
  controller.select_digits
  controller.select_seconds
  controller.generate_numbers_and_show
  controller.answer_numbers
  controller.show_results
end

