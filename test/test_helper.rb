require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  def login_as(usuario)
    post login_url, params: { nome: usuario.nome, password: 'secret' }
  end

  def logout
    delete logout_url
  end

  def setup
    login_as usuarios(:one)
  end
end
