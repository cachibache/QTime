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

class StatementFactory

  def self.unvoted_statement(params = {})
    params[:statement] ||= "some statement"
    params[:true_or_false] ||= true
    unvoted_statement = Statement.create!(params)
  end

  def self.voted_statement(params = {})
    params[:statement] ||= "some statement"
    params[:true_or_false] ||= true
    statement = Statement.create!(params)
    voted_statement = statement.vote_true
  end
end
