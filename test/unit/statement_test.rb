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

class StatementTest < ActiveSupport::TestCase

  test 'can return unvoted statements' do

  end

  test 'can return voted statements' do

  end
end
