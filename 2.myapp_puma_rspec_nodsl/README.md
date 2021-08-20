| 設定項目 | 内容 |
|:--|:--|
|Capybara.app|ハローワールドな超シンプルRackアプリケーション|
|Capybara.server|Puma|
|Capybara.driver|needs_server? -> true だけを定義した超シンプルドライバ|
|テストランナー|**RSpec**|

* Capybara::DSLは未使用。Net::HTTPで自前でHTML取得・アサーションする
* spec/integration 配下にあるものに対して、自動で type: :integration メタデータを付ける。(define_derived_metadata [→参考](https://qiita.com/chiastolite/items/0226cf7afeedaa68e5eb))
* type: :integration のspecを実行する際に、Capybaraドライバの指定やサーバーの起動を行う

```
$ bundle exec rspec

Randomized with seed 34664

myapp
Capybara starting Puma...
* Version 5.4.0 , codename: Super Flight
* Min threads: 0, max threads: 4
* Listening on http://127.0.0.1:62272
  should work

Top 1 slowest examples (0.00637 seconds, 0.5% of total time):
  myapp should work
    0.00637 seconds ./spec/integration/myapp_spec.rb:6

Finished in 1.23 seconds (files took 0.32859 seconds to load)
1 example, 0 failures

Randomized with seed 34664
```
