ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :tweets, :retweet, :likes
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :user_name, :user_photo

  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :user_name, :user_photo]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :user_name, :email, :user_photo, :user_id

  index do
		column 'User_name', :user_name
	
  
  
		column  :tweets do |user|
			user.tweets.count
		end

		column :likes do |user|
			user.likes.count
		end

    #problemas para ver el retweet
    column :retweets do |user|
      user.tweets.where.not(rt_ref: id).count
    end

			
    column 'photo URL' do |user|
		
			user.user_photo do |tweet|
				
			end
		
		end


		actions
	end
end
	
  

  

