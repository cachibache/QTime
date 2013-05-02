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
  validates_uniqueness_of :statement


  def self.find_unvoted(current_user)
    @statements = Statement.includes(:votes).all
    @statements.reject do |s| 
      s.votes.find { |v| v.voter_id == current_user.id } 
    end
  end

  def self.find_voted(current_user)
    @statements = Statement.includes(:votes).all
    @statements.select do |s|
      s.votes.find { |v| v.voter_id == current_user.id }
    end
  end
end
