class UserController < ApplicationController
    def index 
        @house=House.all
    end

    def show 
        @house=House.find(params[:id])
    end

    private

        def  house_param 
             params.required(:house).permit(:type ,:location, :buying_price ,:rental_price)
        end
    end

end
