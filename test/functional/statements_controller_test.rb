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
    post :create, { :statement => {:statement => "some statement", :true_or_false => "true"} }, 
      { :user_id => user.id }
    assert_equal 1, Statement.count
  end

  test 'cannot create statement if not logged in' do
    user = UserFactory.user
    assert_equal 0, Statement.count
    post :create, { :statement => {:statement => "some statement", :true_or_false => "true"} }
    assert_equal 0, Statement.count
  end

  test 'can delete a statement if logged in' do
    user = UserFactory.user
    statement = StatementFactory.unvoted_statement
    assert_equal 1, Statement.count
    delete :destroy, { :id => statement.id }, { :user_id => user.id }
    assert_equal 0, Statement.count
  end

  test 'cannot delete a statement if not logged in' do
    user = UserFactory.user
    statement = StatementFactory.unvoted_statement
    assert_equal 1, Statement.count
    delete :destroy, { :id => statement.id }
    assert_equal 1, Statement.count
  end

  test 'can edit statement if logged in' do
    user = UserFactory.user
    statement = StatementFactory.unvoted_statement
    assert_equal 'some statement', statement.statement
    put :update, { :statement => { :statement => 'another statement'}, :id => statement.id }, { :user_id => user.id }
    assert_equal 'another statement', assigns(:statement).statement
  end

  test 'cannot edit statement if not logged in' do
    user = UserFactory.user
    statement = StatementFactory.unvoted_statement
    assert_equal 'some statement', statement.statement
    put :update, { :statement => { :statement => 'another statement'}, :id => statement.id }
    assert_equal 'some statement', statement.statement
  end

  test 'can vote true' do
    user = UserFactory.user
    statement = StatementFactory.unvoted_statement
    get :vote_true, { :id => statement.id }, { :user_id => user.id }
    assert_equal true, assigns(:vote).vote
  end

  test 'can vote false' do
    user = UserFactory.user
    statement = StatementFactory.unvoted_statement
    get :vote_false, { :id => statement.id }, { :user_id => user.id }
    assert_equal false, assigns(:vote).vote
  end
end
