# new
get '/posts/new'  do 
	@token = SecureRandom.base64
	erb :"posts/new"
end

# show
get '/posts/:id' do
	@post = Post.find_by(id: params[:id])
	erb :"posts/show"
end

# create
post '/posts' do
	# process the Categories
	list_of_categories = params[:categories].split(", ")
	# find or create by for all the categories
	list_of_categories.map! do |category|
		Category.find_or_create_by(name: category.downcase)
	end

	# for each category, create the post
	list_of_categories.each do |category|
		category.posts.create(params[:post])
	end

	redirect '/'
end

# edit
get '/posts/:id/edit' do
	@post = Post.find_by(id: params[:id])
	erb :"posts/edit"
end

# update / destroy
post '/posts/:id' do
	byebug
	if params[:decision]=="edit"
		path = '/posts/1'
	else params[:decision]=="delete"
		path = "/"
	end
	redirect path
end
