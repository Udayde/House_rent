class HouseDecorator < BaseDecorator
	def house_prices
		"Buying price -#{buying_price}\nRentalPrice - #{rental_price}"
	end

	# def description
	# 	"House Type: #{description}"
	# end
end