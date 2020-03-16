# ASSESSMENT 6: Rails Commenting Challenge
# Add comments to the Rails Blog Post Challenge
# Explain the purpose and functionality of the code directly below the 10 comment tags


# app/controller/blog_posts_controller.rb

# 1)
class BlogPostsController < ApplicationController
  def index
    # 2) stores all the instances of blogposts
    @posts = BlogPost.all
  end

  def show
    # 3)stores the blogpost with the specified paramater
    @post = BlogPost.find(params[:id])
  end

  # 4)
  def new
  end

  def create
    # 5) puts all the data from the form (from 'new.html.erb') and store it as a new instance of blogpost
    @post = BlogPost.create(blog_post_params)
    if @post.valid?
      redirect_to @post
    else
      render action: :new
    end
  end

  def delete
    @post = BlogPost.find(params[:id])
    if @post.destroy
      redirect_to blog_posts_path
    else
      # 6) making sure the user stays on the page
      redirect_to blog_post_path(@post)
    end
  end

  # 7)
  private
  def blog_post_params
    # 8)
    params.require(:blog_post).permit(:title, :content)
  end

end


# app/models/blog_post.rb

# 9)
class BlogPost < ApplicationRecord
  # 10)
  has_many :comments
end
