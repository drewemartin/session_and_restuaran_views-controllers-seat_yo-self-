def create
	user = User.find_by_email(param[:email])
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect_to restaurants_url, :notice 'Logged in'
	else
		render 'new'
	end	
end

def destroy
	session[:user] = nil
	redirect_to restaurants_url, :notice 'Logged out'
end