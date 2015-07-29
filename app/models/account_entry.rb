class AccountEntry < ActiveRecord::Base
	belongs_to :account	

	validates :account_id, presence: true
	validates_associated :account

	after_save :update_account_balance!, :if => :approved?	

	scope :approved, -> { with_state(:approved) }
	# Comment. El siguiente scope lo hago solo para comprobar que se puede escribir de diferente formas. El helper with_state creo es de la gema 'state_machines'.
	# scope :rejected, -> { where("state LIKE ?", "submitted") }
	scope :rejected, -> { where(state: "submitted") }


	state_machine :state, :initial => :submitted do
		event :approve do
			transition :submitted => :approved
		end

		event :reject do
			transition :submitted => :rejected
		end
	end

	def update_account_balance!
		account.update_balance!
	end
end