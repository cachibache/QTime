require 'test_helper'
require 'factories/user_factory'
require 'factories/statement_factory'

class StatementsControllerTest < ActionController::TestCase

  test "should get index" do
    user = UserFactory.user
    get :index, {}, { :user_id => user.id }
    assert_response :success
  end

  test "should get new if logged in" do
    user = UserFactory.user
    get :new, {}, { :user_id => user.id }
    assert_response :success
  end

  test 'can create statement if logged in' do
    user = UserFactory.user
    assert_equal 0, Statement.count
    post :create, { :statement => {:statement => "some statement", :true_or_false => "true"}}, 
      { :user_id => user.id }
    assert_equal 1, Statement.count
  end

  test 'cannot create statement unless logged in' do

  end

  test 'can vote true' do
    user = UserFactory.user
    statement = StatementFactory.unvoted_statement
    get :vote_true, { :id => statement.id }, { :user_id => user.id }
    vote = assigns(:vote).vote
    assert_equal true, vote
  end

  test 'can vote false' do

  end
end
