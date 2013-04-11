class UserFactory

  def self.user(params = {})
    params[:statement] ||= "some statement"
    User.create!(params)
  end
end