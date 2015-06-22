ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  def is_logged_in?
    !session[:user_id].nil?
  end
  
  def login_as(user)
    password = 'password'
    if integration_test?
      post login_path, session: { username: user.email, password: password }
    else
      session[:user_id] = user.id
    end
  end
  
  #controller methods
  
  def title_response(list) #list = [[:page, "title"], [:page, "title"]]
    list.each do |pair|
      get pair[0]
      assert_response :success
      assert_select "title", pair[1] + " | KGO"
    end
  end
  


#integration methods

  def links(list) #list = [[x_path, count], [y_path, count]]
    list.each do |pair|
      if pair.is_a? Array
        assert_select "a[href=?]", pair[0], count = pair[1]
      else
        assert_select "a[href=?]", pair[0]
      end
    end
  end
  
  
  private
  
    def integration_test?
      defined?(post_via_redirect)
    end
  
end
