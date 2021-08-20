require 'spec_helper'

RSpec.describe 'myapp' do
  let(:base_url) { Capybara.current_session.server.base_url }

  it 'should work' do
    require 'net/http'

    url = "#{base_url}/"
    response = Net::HTTP.get_response(URI(url))
    expect(response).to be_a(Net::HTTPSuccess)
    expect(response.body).to match(/It works!/)
  end
end
