class HousesController < ApplicationController
    authorize_resource

    def index 
        @q = House.ransack(params[:q])
        @house = @q.result(distinct: true)
        # @house=House.all
    end


    def new
        @house=House.new
    end

    def create
			@house=House.new(house_param)
            @house.profile_image.attach(params[:house][:profile_image])
			if @house.save
				flash[:notice] = 'success registeration!'
				redirect_to houses_path
			else
				p @house.errors.full_messages
				render :new
			end
    end

    def edit
        @house=House.find(params[:id])
    end

    def update
        @house=House.find(params[:id])
        if params[:house][:profile_image].present?
            @house.profile_image.attach(params[:house][:profile_image])
        end
        if @house.update(house_param)
            flash[:notice] = 'success update!'
            redirect_to houses_path
        end
    end

    def destroy 
        House.find(params[:id]).destroy
				flash[:notice] = 'deleted sucessfully'
				redirect_to houses_path
    end

    def show
        @house=House.find(params[:id])
        @feedbacks = @house.feeds
        @feed = Feed.new
    end
  

    private

    def house_param
        #debugger
        @res = params.require(:house).permit(:desription ,:location, :buying_price ,:rental_price,:available_for,:sold)
				@res[:user_id] = current_user.id
				@res[:name] = current_user.name
				@res
    end

end



