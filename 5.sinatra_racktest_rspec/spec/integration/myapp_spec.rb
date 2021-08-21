require 'spec_helper'

RSpec.describe 'myapp' do
  it 'should work' do
    visit '/'
    expect(page).to have_text('It works!')
  end
end
