class ModeratorController < ApplicationController
    def index 
        @house=House.all
    end


    def new
        @house=House.new
    end

    def create
        @house=House.new(house_param) 
    end

    def edit 
        @house=House.find(params[:id])
    end

    def update
        @house=House.find(params[:id])
        @house.update(house_param)
    end

    def destroy 
        @house=House.find(params[:id])
        @house.destroy
    end

    def show 
        @house=House.find(params[:id])
    end

    private

        def  house_param 
             params.required(:house).permit(:type ,:location, :buying_price ,:rental_price)
        end
    



end
