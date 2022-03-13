require './lib/key'
require './lib/diatonic_scale'

# 楽譜
class MusicSheet
  attr_accessor :contents
  attr_reader :song_name, :key, :diatonic_scale, :contents

  def initialize(song_name:, key_name: "C")
    @song_name      = song_name
    @key            = Key.new(key_name)
    @diatonic_scale = DiatonicScale.new(@key)
    @contents       = []
  end

  def build(&block)
    yield self

    self.contents.join("-")
  end

  def chord(name)
    Chord.new(name)
  end

  def diatonic_chord(number)
    diatonic_scale.diatonic_chords[number - 1].name
  end

  def write(element)
    self.contents << element
  end
end