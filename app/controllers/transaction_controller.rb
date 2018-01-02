class TransactionController < ApplicationController

	def create
		content = content.find_by!(slug: params[:slug])
		sale = contents.create (
			amount: content.price,
			email_acquirente: current_user.email,
			email_venditore: content.user.email
				
			)
		
		redirect_to pickup_url(guid: @sale.guid)

		redirect_to content_path(content), notice: @error

	end

	def pickup
		@sale = Sale.find_by!(slug: params[:slug])
		@content = @sale.content

	end

end
