require 'spec_helper'

RSpec.describe 'myapp' do
  it 'should work' do
    @page.goto("#{@base_url}/")
    h1 = @page.wait_for_selector('h1')
    expect(h1.evaluate('el => el.textContent')).to include('It works!')
  end
end
