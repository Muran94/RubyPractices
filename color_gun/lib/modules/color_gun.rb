module ColorGun
  COLORS = {
    black:  30, # 黒
    red:    31, # 赤
    green:  32, # 緑
    yellow: 33, # 黄色
    blue:   34, # 青
    purple: 35, # 紫
    cyan:   36, # シアン
    white:  37, # 白
  }.freeze

  # ==== 引数
  # * +bullet+ - 文字列
  # * +color+ - 定数COLORS内のいずれかのキー。
  # * +distance+ - 飛距離。整数値。
  # ==== 戻り値
  # 例） ColorGun.shoot!("¥3,900", color: :yellow, distance: 15)
  # (黄色で) => "--------------> ¥3,900
  def shoot!(bullet, color: :white, distance: 15)
    puts %(\u001b[#{COLORS[color]}m#{"-" * (distance - 1)}> #{bullet}\u001b[0m)
  end
end