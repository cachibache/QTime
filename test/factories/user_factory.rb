# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserFactory

  def self.user(params = {})
    params[:provider] ||= 'twitter'
    params[:uid] ||= '467513442'
    User.create!(params)
  end
end
