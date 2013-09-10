
require 'digest/sha2'
class User < ActiveRecord::Base
  attr_accessible :password,:password_confirmation, :name

  validates :name,presence: true,uniqueness: true
 
has_secure_password

  after_destroy :ensure_an_admin_remains

  private

  def ensure_an_admin_remains

    if User.count.zero?
      raise "Cant delete last user"
    end
  end
end