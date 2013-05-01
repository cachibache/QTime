require 'test_helper'
require 'factories/user_factory'

class SessionsControllerTest < ActionController::TestCase

  # test 'a session can be created' do
  #   user = UserFactory.user
  #   post :create, { :provider => user.provider, :uid => user.uid }
  #   assert_equal user.id, session[:user_id]
  # end

  # test 'an unauthenticated user cannot create a session' do
  #   user = UserFactory.user
  #   post :create, { :provider => 'wrong provider', :uid => 'wrong uid' }
  #   refute session[:user_id]
  # end

  # test 'a session can be ended/destroyed' do
  #   user = UserFactory.user
  #   post :create, { :provider => user.provider, :uid => user.uid }
  #   assert_equal user.id, session[:user_id]
  #   delete :destroy, { :id => session[:user_id] }
  #   refute session[:user_id]
  # end
end