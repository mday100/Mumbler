module UsersHelper
def current_user
	session[:user_id].nil? ? nil : User.find(session[:user_id])
end

def current_user2
	session[:user_id] ? User.find(session[:user_id]) : nil
end

def follow_link(current_user, target)
	if current_user
		if current_user == target
		elsif current_user.followeds.include? target
			link_to("Unfollow", "unfollow/#{target.id}", method: "post")
		else
			link_to("Follow", "follow/#{target.id}", method: "post")
		end
	end
end
end