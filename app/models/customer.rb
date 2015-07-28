class Customer < Account
	has_many :time_entries
end

#@customer.time_entries #Solamente retorna TimeEntries
#@customer.account #Retorna un mix de TimeEntries y AccountEntries