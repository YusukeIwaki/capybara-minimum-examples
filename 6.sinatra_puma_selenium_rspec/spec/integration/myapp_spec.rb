require 'spec_helper'

RSpec.describe 'myapp' do
  # capybara/rspecのおせっかいにより、
  # driver: xxx と指定したものがbefore でcurrent_driverに指定される。
  # https://github.com/teamcapybara/capybara/blob/master/lib/capybara/rspec.rb#L28

  it 'should work (headless)', driver: :headless_chrome do
    visit '/'
    expect(page).to have_text('It works!')
  end

  it 'should work (headful)', driver: :chrome do
    visit '/'
    expect(page).to have_text('It works!')
  end

  # 今回はspec_helperでrack_testドライバは登録していないが、
  # 実はrequire 'capybara'するだけで勝手にrack_testと各種seleniumドライバ登録をしちゃってる！！
  # のでrack_testドライバは何もしなくても使えてる。
  # https://github.com/teamcapybara/capybara/blob/master/lib/capybara/registrations/drivers.rb
  it 'should work (RackTest)', driver: :rack_test do
    visit '/'
    expect(page).to have_text('It works!')
  end

  # これもCapybaraが勝手に登録している。画面ありChrome
  it 'should work (selenium_chrome)', driver: :selenium_chrome do
    visit '/'
    expect(page).to have_text('It works!')
  end
  it 'should work (selenium_chrome_headless)', driver: :selenium_chrome_headless do
    visit '/'
    expect(page).to have_text('It works!')
  end
end
