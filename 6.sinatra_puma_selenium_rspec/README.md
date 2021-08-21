| 設定項目 | 内容 |
|:--|:--|
|Capybara.app|Sinatraアプリケーション|
|Capybara.server|Puma|
|Capybara.driver|Capybara::**Selenium**ドライバ|
|テストランナー|RSpec|

* Sinatraアプリケーションを、**Railsのシステムテストのデフォルト設定と同じ構成**で試験しています。
  * Seleniumドライバ経由でChromeを使用
  * RSpecでテスト実行
* 5番目のサンプルでは、spec_helperで一括してrack_testドライバを使用する設定になっていたところを、今回はテストケースごとに使用するドライバを変更するように変えています。 ここでも `capybara/rspec` のおせっかいが登場します。
* 今回はrack_testドライバを手動で登録していないのに、rack_testドライバが使えてしまう `capybara` のおせっかいも登場します。
  * Capybaraは何もしなくても、勝手にRackTestとSeleniumドライバをChrome/Firefoxの両方登録してくれている。https://github.com/teamcapybara/capybara/blob/master/lib/capybara/registrations/drivers.rb
* さらに、 `Capybara.server = :puma` と明示的に書いていないのにPumaがちゃんと起動する。
  * なんとCapybaraは何しなくても、勝手にPumaをサーバー起動する。https://github.com/teamcapybara/capybara/blob/master/lib/capybara/registrations/servers.rb

```
$ bundle exec rspec

Randomized with seed 20699

myapp
Capybara starting Puma...
* Version 5.4.0 , codename: Super Flight
* Min threads: 0, max threads: 4
* Listening on http://127.0.0.1:50592
  should work (selenium_chrome)
  should work (headful)
  should work (RackTest)
  should work (headless)
  should work (selenium_chrome_headless)

Top 5 slowest examples (7.81 seconds, 97.3% of total time):
  myapp should work (selenium_chrome)
    2.53 seconds ./spec/integration/myapp_spec.rb:28
  myapp should work (headful)
    2.4 seconds ./spec/integration/myapp_spec.rb:13
  myapp should work (headless)
    1.49 seconds ./spec/integration/myapp_spec.rb:8
  myapp should work (selenium_chrome_headless)
    1.38 seconds ./spec/integration/myapp_spec.rb:32
  myapp should work (RackTest)
    0.0079 seconds ./spec/integration/myapp_spec.rb:22

Finished in 8.03 seconds (files took 0.49456 seconds to load)
5 examples, 0 failures

Randomized with seed 20699
```
