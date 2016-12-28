class PostsController < ApplicationController
	def new
		@post = Post.new
 	end
 	def create
 		puts "the params are #{params[:post].inspect}"

 		# a = params.require(:post).permit(:name, :content)
 		# puts "a is #{a.inspect}"
 		 @post = Post.create(post_params)
 	end

 	def post_params
 		params.require(:post).permit(:name, :content)
 	end
end
