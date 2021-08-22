# 最小構成の[Capybara](https://github.com/teamcapybara/capybara)サンプル集

| |app|server|driver|自動操作|アサーション|テストランナー|
|:--|:--|:--|:--|:--|:--|:--|
|1|自前Rackアプリ|Puma| null | - | 自前 | MiniTest |
|2|自前Rackアプリ|Puma| null | - | 自前 | RSpec |
|3|自前Rackアプリ| - | Capybara::RackTest | Capybara::Driver | 自前 | MiniTest |
|4|Sinatraアプリ| - | Capybara::RackTest | Capybara::DSL | Capybara::MiniTest::Assertions | MiniTest |
|5|Sinatraアプリ| - | Capybara::RackTest | Capybara::DSL | Capybara::RSpec::Matchers | RSpec |
|6|Sinatraアプリ|Puma| Capybara::Selenium | Capybara::DSL | Capybara::RSpec::Matchers | RSpec |
|6x|Sinatraアプリ|Puma| Capybara::Selenium | Capybara::DSL, Puppeteer | Capybara::RSpec::Matchers, 自前 | RSpec |
