require 'test_helper'
require 'factories/statement_factory'

class StatementsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test 'can create new statement' do
    assert_equal 0, Statement.count
    post :create, { :statement => {:statement => "some statement"} }
    assert_equal 1, Statement.count
  end

  test 'can create statement with false value' do
    assert_equal 0, Statement.count
    post :create, { :statement => {:true_or_false => "false"} }
    assert_equal 1, Statement.count
  end

  test 'can create statement with true value' do
    assert_equal 0, Statement.count
    post :create, { :statement => {:true_or_false => "true"} }
    assert_equal 1, Statement.count
  end

end