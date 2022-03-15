print 'How many uuids?: '
amount = gets.chomp.to_i

amount.times do
  uuid = "123456"
  uuid = uuid.chars.map do |c|
    available_char = ("a".."z").to_a + ("0".."9").to_a
    available_char.sample
  end.join

  puts uuid
end