class AccountsController < ApplicationController
	def index
		# Comment. En el metodo defino Customer.all en vez de Account.all porque en la vista de Accounts deseo mostrar solo las cuentas de los cleintes, y no a lo clientes y empeados.
		@accounts = Customer.all
	end

	def show
		@account = Account.find(params[:id])
	end
end
