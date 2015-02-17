module SessionsHelper
	def sign_in(user)
		session[:user_id] = user.id
		session[:user_name] = user.first_name
		self.current_user = (user)
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		session[:user_id] = nil
		session[:user_name] = nil
		self.current_user = nil
	end

	def current_user?(user)
		user == self.current_user
	end

	def deny_access
		redirect_to root_path, notice: "Please sign in to access this page."
	end

	def require_signed_in
		if !signed_in?
			deny_access
		end
	end
end
