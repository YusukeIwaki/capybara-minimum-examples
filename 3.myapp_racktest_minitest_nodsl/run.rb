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

# https://github.com/teamcapybara/capybara/blob/master/lib/capybara/rails.rb
# と同じ内容でrack_testドライバを登録
Capybara.register_driver :rack_test do |app|
  Capybara::RackTest::Driver.new(app, respect_data_method: true)
end
Capybara.current_driver = :rack_test

# テストランナーにはMiniTestを使う
require 'minitest/autorun'
require 'minitest/unit'
require 'capybara/minitest'

class MyAppTest < Minitest::Test
  def setup
    # ここで（初めて Capybara.current_session.driver を参照するタイミングで）
    # RackTestドライバのテストセッションが開始される。
    @driver = Capybara.current_session.driver
  end

  def teardown
    Capybara.reset_sessions!
  end

  def test_it_works
    @driver.visit('/')
    assert_match /It works!/, @driver.html
  end
end
