class User < ApplicationRecord
  	# Include default devise modules. Others available are:
  	# :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

	validates :firstname,  presence: true, length: { maximum: 100 }    
    validates :lastname,  presence: true, length: { maximum: 100 }     

    def soft_delete  
		update_attribute(:deleted_at, Time.current)  
	end 
   
	# ensure user account is active  
	def active_for_authentication?  
		super && !deleted_at  
	end  

	# provide a custom message for a deleted account   
	def inactive_message   
		!deleted_at ? super : :deleted_account  
	end
end
