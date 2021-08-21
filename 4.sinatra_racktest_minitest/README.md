| 設定項目 | 内容 |
|:--|:--|
|Capybara.app|Sinatraアプリケーション|
|Capybara.server| - |
|Capybara.driver|Capybara::RackTestドライバ|
|テストランナー|MiniTest|

* MyAppTestWithoutDSL: Capybara::DSLを未使用
  * Capybaraドライバのメソッドを直接使用してHTML取得
* MyAppTestWithDSL: Capybara::DSLとMinitest用マッチャーを使用
  * visit, assert_textなどを使用

```
$ bundle exec ruby run.rb
Run options: --seed 44142

# Running:

..

Finished in 0.026386s, 75.7978 runs/s, 113.6967 assertions/s.

2 runs, 3 assertions, 0 failures, 0 errors, 0 skips
```
