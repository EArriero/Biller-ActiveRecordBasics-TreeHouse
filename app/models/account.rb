class Account < ActiveRecord::Base
	has_many :account_entries

	validates :name, presence: true,
					 length: { in: 1..70,
					   message: "El nombre debe tener entre 1 y 70 caracteres" },
					 uniqueness: true
end
