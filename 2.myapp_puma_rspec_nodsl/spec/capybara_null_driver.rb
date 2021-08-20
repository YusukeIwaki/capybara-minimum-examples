require 'capybara'

class CapybaraNullDriver < Capybara::Driver::Base
  def needs_server?
    true
  end
end
