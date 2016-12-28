class PostsController < ApplicationController
	def new
		@post = Post.new
 	end

 	def create
 		puts "the params are #{params[:post].inspect}"

 		# a = params.require(:post).permit(:name, :content)
 		# puts "a is #{a.inspect}"
 		 @post = Post.new(post_params)
 		 if @post.save
 		 	flash[:success] = "You have saved your post"
 		 	redirect_to new_post_path
 		 else
 		 	render 'new'
 		 	#do some other stuff
 		 end
 	end

 	def post_params
 		params.require(:post).permit(:name, :content)
 	end
end
