class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_secure_password

  validates :name, :password, :password_confirmation,presence: true

  validates :name,uniqueness: true

  after_destroy :ensure_an_admin_remains


  private

  	def ensure_an_admin_remains
 
 		if User.count.zero?
			raise "cant delete last user"
		end
	end
end
