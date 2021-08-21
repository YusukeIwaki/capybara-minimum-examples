require 'sinatra/base'

class MyApp < Sinatra::Base
  get('/') { '<h1>It works!</h1>' }
end
