
def index
	@restaurants = Restaurant.all.first(5)
end 

def show
	@restaurant = Restaurant.find(params[:id])	
end

def edit
	@restaurant = Restaurant.find(params[:id])
end

def update
	@restaurant = Restaurant.find(params[:id])
	if @restaurant.update_attributes(restaurant_params)
		redirect_to restaurant_params, :notice => "Your update was saved"
	else
		render 'edit'
	end
end

def new
	@restaurant = Restaurant.find(params[:id])
end

def create
	@restaurant = Restaurant.new(restaurant_params)
	if @restaurant
		@restaurant.save
		redirect_to restaurant, :notice => "ThanK you for adding a new restaurant"
	else
		render 'new'
	end
end

private
def restaurant_params
	params.require(:restaurant).permit(:name, :cuisine, :address)
end