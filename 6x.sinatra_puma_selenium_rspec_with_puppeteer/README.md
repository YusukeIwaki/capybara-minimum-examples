| 設定項目 | 内容 |
|:--|:--|
|Capybara.app|Sinatraアプリケーション|
|Capybara.server|Puma|
|Capybara.driver|Capybara::**Selenium**ドライバ|
|テストランナー|RSpec|

* 6番目のサンプルの構成（Selenium/Chrome＋RSpec）をベースにPuppeteerを組み込むサンプルです。
  * 基本はCapybara::Seleniumドライバを使用し、一部でPuppeteerによる操作を行うケース
  * Capybara::SeleniumドライバもCapybara::DSLも使用せず、純粋にPuppeteerによる操作を行うケース

**Seleniumが弱い部分をピンポイントでPuppeteerで補強**したいときにこのサンプルのような構成をとります。
詳しいPuppeteerの組み込み方法については、別途ドキュメントを参考にしてください。

* https://github.com/YusukeIwaki/puppeteer-ruby#bulb-collaboration-with-selenium-or-capybara
* https://github.com/YusukeIwaki/puppeteer-ruby-example/tree/master/_with_capybara-rspec

```
$ bundle exec rspec

myapp
Capybara starting Puma...
* Version 5.4.0 , codename: Super Flight
* Min threads: 0, max threads: 4
* Listening on http://127.0.0.1:52188
  should work (Puppeteer)
  should work (headless_chrome with Puppeteer)
  should work (headless_chrome)

Top 3 slowest examples (5.63 seconds, 90.8% of total time):
  myapp should work (Puppeteer)
    2.24 seconds ./spec/integration/myapp_spec.rb:24
  myapp should work (headless_chrome with Puppeteer)
    1.94 seconds ./spec/integration/myapp_spec.rb:9
  myapp should work (headless_chrome)
    1.44 seconds ./spec/integration/myapp_spec.rb:4

Finished in 6.2 seconds (files took 0.52278 seconds to load)
3 examples, 0 failures

Randomized with seed 35321

```
