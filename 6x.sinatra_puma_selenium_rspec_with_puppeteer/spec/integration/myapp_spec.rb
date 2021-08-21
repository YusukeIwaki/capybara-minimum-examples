require 'spec_helper'

RSpec.describe 'myapp' do
  it 'should work (headless_chrome)', driver: :headless_chrome do
    visit '/'
    expect(page).to have_text('It works!')
  end

  it 'should work (headless_chrome with Puppeteer)', driver: :headless_chrome_with_puppeteer do
    # Seleniumのvisitはページ遷移が完了する前にreturnして次に進んでしまうため、
    # visitの直後にPuppeteerで何かをしたい場合には必ずwait_for_navigationでページ遷移を明示的に待つ必要がある。
    @puppeteer_page.wait_for_navigation do
      visit '/'
    end

    # Puppeteerを使用した操作
    h1_text = @puppeteer_page.eval_on_selector('h1', '(el) => el.innerText')
    expect(h1_text).to eq('It works!')

    # 従来どおりCapybara::Seleniumドライバを使用した操作・アサーション
    expect(page).to have_text('It works!')
  end

  it 'should work (Puppeteer)', driver: :null do
    # nullドライバはサーバーを起動するのみなので、Capybara::DSLは使えない。
    expect { visit '/' }.to raise_error(/NotImplementedError/)

    @puppeteer_page.goto("#{@base_url}/")

    # Puppeteerを使用した操作
    h1_text = @puppeteer_page.eval_on_selector('h1', '(el) => el.innerText')
    expect(h1_text).to eq('It works!')
  end
end
