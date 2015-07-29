class Customer < Account
	has_paper_trail	
	
	has_many :time_entries

	scope :premier, -> { where("employees > ?", 80)}
	scope :newest, -> { order("created_at DESC") } 
	scope :starts_with, -> (letter) { where("name LIKE ?", letter + "%") }
end

#@customer.time_entries #Solamente retorna TimeEntries
#@customer.account #Retorna un mix de TimeEntries y AccountEntries