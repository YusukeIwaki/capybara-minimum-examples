| 設定項目 | 内容 |
|:--|:--|
|Capybara.app|ハローワールドな超シンプルRackアプリケーション|
|Capybara.server|Puma|
|Capybara.driver|needs_server? -> true だけを定義した超シンプルドライバ|

* テストではなく、Pryコンソールで動作を確認する用
  * サーバー起動後は、Net::HTTPでなくともブラウザでもアクセス可

```
$ bundle exec ruby run.rb
[1] pry(main)> Capybara.current_session.server
Capybara starting Puma...
* Version 5.5.0 , codename: Zawgyi
* Min threads: 0, max threads: 4
* Listening on http://127.0.0.1:59092
=> #<Capybara::Server:0x00007fb5f542dda0
 @app=#<Proc:0x00007fb5f51babb8 run.rb:4>,
 @checker=#<Capybara::Server::Checker:0x00007fb5f542dc10 @host="127.0.0.1", @port=59092, @ssl=false>,
 @extra_middleware=[],
 @host="127.0.0.1",
 @middleware=
  #<Capybara::Server::Middleware:0x00007fb5f5427518
   @app=#<Proc:0x00007fb5f51babb8 run.rb:4>,
   @counter=
    #<Capybara::Server::Middleware::Counter:0x00007fb5f54274a0 @mutex=#<Thread::Mutex:0x00007fb5f5427450>, @value=[]>,
   @extended_app=#<Proc:0x00007fb5f51babb8 run.rb:4>,
   @server_errors=[Exception]>,
 @port=59092,
 @reportable_errors=[Exception],
 @server_thread=
  #<Thread:0x00007fb5f5427680 /Users/yusuke-iwaki/.rbenv/versions/2.7.2/lib/ruby/gems/2.7.0/gems/capybara-3.35.3/lib/capybara/server.rb:76 sleep_forever>>

[2] pry(main)> Net::HTTP.get(URI("http://127.0.0.1:59092/"))
=> "<h1>It works!</h1>"
```
