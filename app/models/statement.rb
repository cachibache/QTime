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

class Statement < ActiveRecord::Base

  attr_accessible :statement, :true_or_false

  acts_as_voteable

  validates :statement, :presence => :true
  validates :true_or_false, :inclusion => {:in => [true, false]}

end
