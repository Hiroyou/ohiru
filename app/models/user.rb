class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  # attr_accessible :title, :body

  def self.find_for_facebook_oauth(access_token)
    data = access_token.extra.raw_info

    # Return the user found by the facebook id
    if user = User.find_by_facebook_id(data.id)
      return user
    end

    # Set the facebook id if the user already registered.
    if user = User.find_by_email(data.email)
      user.facebook_id = data.id
      user.save!
      return user
    end

    # Create a user with a stub password.
    user = User.new(email: data.email, password: Devise.friendly_token[0,20],
                    first_name: data.first_name, last_name: data.last_name)
    user.facebook_id = data.id
    user.save!
    return user
  end
end
