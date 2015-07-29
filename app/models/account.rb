class Account < ActiveRecord::Base
	has_many :account_entries, dependent: :destroy

	validates :name, presence: true,
					 length: { in: 1..70,
					   message: "El nombre debe tener entre 1 y 70 caracteres" },
					 uniqueness: true

	def update_balance!
    	update_attributes(
    		balance: self.account_entries.approved.sum(:amount)
    		)
  	end					 
end