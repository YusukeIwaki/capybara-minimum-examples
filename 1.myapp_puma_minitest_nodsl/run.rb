require 'capybara'

# Rackアプリケーションの登録
Capybara.app = Proc.new do |env|
  status = 200
  headers = {
    'Content-Type' => 'text/html',
  }
  body = Enumerator.new do |buf|
    buf << '<h1>It works!</h1>'
  end

  [status, headers, body]
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

# テストランナーにはMiniTestを使う
require 'minitest/autorun'
require 'minitest/unit'

class MyAppTest < Minitest::Test
  def setup
    # ここでPumaが起動する
    # (Capybaraは初めてcurrent_session.serverを参照されたタイミングでサーバーを起動する)
    current_server = Capybara.current_session.server

    @base_url = current_server.base_url
  end

  def test_it_works
    require 'net/http'

    url = "#{@base_url}/"
    response = Net::HTTP.get_response(URI(url))
    assert_kind_of Net::HTTPSuccess, response
    assert_match /It works!/, response.body
  end
end
