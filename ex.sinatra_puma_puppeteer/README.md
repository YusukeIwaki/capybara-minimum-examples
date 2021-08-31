Capybaraを使わず、自前でサーバーを起動する。

```
$ bundle exec rspec

Randomized with seed 30154
Puma starting in single mode...
* Puma version: 5.4.0 (ruby 3.0.2-p107) ("Super Flight")
*  Min threads: 0
*  Max threads: 4
*  Environment: development
*          PID: 53010
* Listening on http://0.0.0.0:3000
Use Ctrl-C to stop

myapp
  should work

Top 1 slowest examples (2.28 seconds, 87.1% of total time):
  myapp should work
    2.28 seconds ./spec/integration/myapp_spec.rb:4

Finished in 2.62 seconds (files took 0.11656 seconds to load)
1 example, 0 failures

Randomized with seed 30154
```
