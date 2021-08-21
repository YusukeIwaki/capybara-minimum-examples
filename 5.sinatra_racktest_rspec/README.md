| 設定項目 | 内容 |
|:--|:--|
|Capybara.app|Sinatraアプリケーション|
|Capybara.server| - |
|Capybara.driver|Capybara::RackTestドライバ|
|テストランナー|RSpec|

* SinatraアプリケーションをRackTestドライバを使用してRSpecでテストする、**最も標準的で素直な、多くのサンプルのベースになる構成**です。
* 4番目のサンプルではMiniTestだったテストランナーがRSpecへ変更になるだけかと思いきや、 `capybara/rspec` が想像以上に色々やっちゃってくれるところが見どころです。https://github.com/teamcapybara/capybara/blob/master/lib/capybara/rspec.rb

```
$ bundle exec rspec

Randomized with seed 22459

myapp
  should work

Top 1 slowest examples (0.05888 seconds, 21.5% of total time):
  myapp should work
    0.05888 seconds ./spec/integration/myapp_spec.rb:4

Finished in 0.27432 seconds (files took 0.4857 seconds to load)
1 example, 0 failures

Randomized with seed 22459
```
