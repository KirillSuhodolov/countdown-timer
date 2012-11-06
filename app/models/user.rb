class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name



  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
  	data = access_token
    if user = self.find_by_email(data.email)
      user
    else 
      user = User.new(:name => access_token.extra.raw_info.name,
                      :email => access_token.info.email, 
      	              :password => Devise.friendly_token[0,20]) 
     
      user.save!
      user
    end
  end 

  def self.find_for_github_oauth(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = self.find_by_email(data.email)
      user
    else 
      user = User.new(:name => data.nickname,
                      :email => data.email, 
      	              :password => Devise.friendly_token[0,20]) 
     
      user.save!
      user
    end
  end

end
