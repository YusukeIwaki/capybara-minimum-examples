require 'capybara'

# Rackアプリケーションの登録
Capybara.app = Proc.new do |env|
  [200, { 'Content-Type' => 'text/html' }, ['<h1>It works!</h1>']]
end

# RackサーバーにはPumaを使う
Capybara.server = :puma

# Capybaraはneeds_server? がtrueのときだけRackサーバーを使用するので、
# ダミードライバを作って登録する必要がある。
# （これをしないと、後述のcurrent_session.serverがnilで返るだけの動作になる）
class NullDriver < Capybara::Driver::Base
  def needs_server?
    true
  end
end
Capybara.register_driver(:null) { NullDriver.new }
Capybara.current_driver = :null

require 'pry'
Pry.start