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
    statement = StatementFactory.statement
    post :create, { :statement => {:statement => "some statement"} }
    assert_equal 1, Statement.count
  end

end