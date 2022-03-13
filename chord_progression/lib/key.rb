# キー(調性)
class Key
  attr_reader :key_name

  def initialize(key_name)
    @key_name = key_name
  end

  # 等値評価。キーの名前が同じであれば、同じと認める。
  # ==== 引数
  # * +key_instance+ - Keyクラスのインスタンス。
  def ==(key_instance)
    return false unless key_instance.instance_of?(Key)

    key_name == key_instance.key_name
  end
end