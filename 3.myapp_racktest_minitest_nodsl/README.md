| 設定項目 | 内容 |
|:--|:--|
|Capybara.app|ハローワールドな超シンプルRackアプリケーション|
|Capybara.server| - |
|Capybara.driver|Capybara::RackTestドライバ|
|テストランナー|MiniTest|

* Capybara::DSLは未使用
  * Capybaraドライバのメソッドを直接使用してHTML取得

```
$ bundle exec ruby run.rb
Run options: --seed 802

# Running:

.

Finished in 0.008177s, 122.2942 runs/s, 244.5885 assertions/s.

1 runs, 2 assertions, 0 failures, 0 errors, 0 skips```
