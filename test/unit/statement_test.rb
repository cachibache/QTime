# == Schema Information
#
# Table name: statements
#
#  id            :integer          not null, primary key
#  statement     :string(255)
#  true_or_false :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'
require 'factories/statement_factory'
require 'factories/user_factory'

class StatementTest < ActiveSupport::TestCase

  test 'can return unvoted statements' do
    user = UserFactory.user
    statement = StatementFactory.unvoted_statement
    unvoted_statements = Statement.find_unvoted(user)
    assert_equal 1, unvoted_statements.count
  end

  test 'can return voted statements' do
    user = UserFactory.user
    statement = StatementFactory.voted_true_statement(user)
    voted_statements = Statement.find_voted(user)
    assert_equal 1, voted_statements.count
  end

  test 'can return the number of statements answered correctly by a user' do
    user = UserFactory.user
    voted_statement = StatementFactory.voted_true_statement(user)
    number_correct_statements = Statement.number_correct?(user)
    assert_equal 1, number_correct_statements
  end

  test 'can return the number of statements answered incorrectly by a user' do
    user = UserFactory.user
    voted_statement = StatementFactory.voted_false_statement(user)
    number_incorrect_statements = Statement.number_incorrect?(user)
    assert_equal 1, number_incorrect_statements
  end
end
