class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :secret_code, presence: true, if: -> {self.admin == false}
  has_one :secret_code
 	enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
  	if self.admin
	    self.role ||= :admin
	  else
	    self.role ||= :user
	  end
  end
end
