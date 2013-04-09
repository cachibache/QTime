class StatementFactory

  def self.statement(params = {})
    params[:statement] ||= "some statement"
    params[:true_or_false] ||= "true"
    Statement.create!(params)
  end
end