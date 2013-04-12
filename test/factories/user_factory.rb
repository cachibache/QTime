class UserFactory

  def self.user(params = {})
    params[:provider] ||= 'twitter'
    params[:uid] ||= '467513442'
    User.create!(params)
  end
end