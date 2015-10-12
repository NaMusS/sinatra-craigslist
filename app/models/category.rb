class Category < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :posts
end
