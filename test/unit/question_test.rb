# == Schema Information
#
# Table name: questions
#
#  id              :integer          not null, primary key
#  question        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  number_of_true  :integer
#  number_of_false :integer
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
