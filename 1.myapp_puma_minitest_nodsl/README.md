| 設定項目 | 内容 |
|:--|:--|
|Capybara.app|ハローワールドな超シンプルRackアプリケーション|
|Capybara.server|Puma|
|Capybara.driver|needs_server? -> true だけを定義した超シンプルドライバ|
|テストランナー|MiniTest|

* Capybara::DSLは未使用。Net::HTTPで自前でHTML取得・アサーションする

```
$ bundle exec ruby run.rb
Run options: --seed 36415

# Running:

Capybara starting Puma...
* Version 5.4.0 , codename: Super Flight
* Min threads: 0, max threads: 4
* Listening on http://127.0.0.1:61168
.

Finished in 0.113431s, 8.8159 runs/s, 26.4478 assertions/s.

1 runs, 3 assertions, 0 failures, 0 errors, 0 skips
```
