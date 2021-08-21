require 'capybara'

# Rackアプリケーションの登録
require 'sinatra/base'

class MyApp < Sinatra::Base
  get('/') { '<h1>It works!</h1>' }
end

Capybara.app = MyApp

# https://github.com/teamcapybara/capybara/blob/master/lib/capybara/rails.rb
# と同じ内容でrack_testドライバを登録
Capybara.register_driver :rack_test do |app|
  Capybara::RackTest::Driver.new(app, respect_data_method: true)
end
Capybara.current_driver = :rack_test

# テストランナーにはMiniTestを使う
require 'minitest/autorun'
require 'minitest/unit'

# DSLなし版 ----------
class MyAppTestWithoutDSL < Minitest::Test
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
# DSLなし版ここまで ----------

# DSLあり版 ----------
# ちょうど下のページに書いてある例
# https://github.com/teamcapybara/capybara#using-capybara-with-minitest
require 'capybara/dsl'
require 'capybara/minitest'

class MyAppTestWithDSL < Minitest::Test
  include Capybara::DSL
  include Capybara::Minitest::Assertions # <-- これが内部的にCapybara::DSLに依存している

  def teardown
    Capybara.reset_sessions!
  end

  def test_it_works
    visit('/')
    assert_text(/It works!/)
  end
end
# DSLあり版ここまで ----------
