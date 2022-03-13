require './lib/chord'

# ダイアトニックスケール
class DiatonicScale
  attr_reader :key, :diatonic_chords

  def self.diatonic_chords(key)
    [
      Chord.new("C"),
      Chord.new("Dm"),
      Chord.new("Em"),
      Chord.new("F"),
      Chord.new("G"),
      Chord.new("Am"),
      Chord.new("Bm-5"),
    ]
  end

  def initialize(key)
    @key             = key
    @diatonic_chords = DiatonicScale.diatonic_chords(@key)
  end

  def ==(diatonic_scale_instance)
    return false unless diatonic_scale_instance.instance_of?(DiatonicScale)

    key == diatonic_scale_instance.key
  end
end