module SessionsHelper

	def log_in(user, remember_me = '0')
		if remember_me == '1'
			cookies.signed[:user_id] = user.id
			session[:user_id] = user.id
		else
			session[:user_id] = user.id
		end
	end 

	def current_user
		current_user ||= User.find_by(id: session[:user_id])
		if current_user
			current_user 
		else 
			current_user ||= User.find_by(id: cookies.signed[:user_id])
			if current_user
				log_in current_user
				current_user
			end
		end
	end

	def log_out
		cookies.delete(:user_id)
		session.delete(:user_id)
		current_user = nil
	end

	def is_logged_in?
		!current_user.nil?
	end
end
