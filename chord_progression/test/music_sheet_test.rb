require 'minitest/autorun'
require './lib/music_sheet'

class MusicSheetTest < Minitest::Test
  def setup
    @music_sheet = MusicSheet.new(song_name: "Sample Song", key_name: "C")
  end

  def test_initialize
    music_sheet = MusicSheet.new(song_name: "Sample Song", key_name: "C")
    assert_equal "Sample Song", music_sheet.song_name
    assert_equal Key.new("C"), music_sheet.key
    assert_equal DiatonicScale.new(music_sheet.key), music_sheet.diatonic_scale
    assert_equal [], music_sheet.contents
  end

  def test_build
    assert_equal(
      "C-Em-F-Dm-Am-F-G-C",
      @music_sheet.build do |ms|
        ms.write ms.diatonic_chord(1)
        ms.write ms.diatonic_chord(3)
        ms.write ms.diatonic_chord(4)
        ms.write ms.diatonic_chord(2)
        ms.write ms.diatonic_chord(6)
        ms.write ms.diatonic_chord(4)
        ms.write ms.diatonic_chord(5)
        ms.write ms.diatonic_chord(1)
      end
    )
  end

  def test_chord

  end

  def test_diatonic_chord

  end
end