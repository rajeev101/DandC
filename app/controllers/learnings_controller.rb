class LearningsController < ApplicationController
   # before_action :set_user, only:[:show]
  def index
    @courses = Course.all
    @faqs = Faq.all
    @instructors = Instructor.all
    @recommendations = Recommendation.all
    @contacts = Contact.all
    @registrations = Registration.all
    @registration = Registration.new
    @banners = Banner.all
  end

  def more
    @categories = Category.all
    @subcategories = Subcategory.all
    @super_sub_categories = SuperSubCategory.all
    @registrations = Registration.all
    @registration = Registration.new
    @topics = Topic.all
  end

  def topic
    @super_sub_category = SuperSubCategory.find_by(params[:id])
    @topics = @super_sub_category.topics
    render 'learnings/topics'
  end

  def procast
    @blogs = Blog.all
  end

  def pdf
    # @registrations = Registration.all
    @registration = Registration.new
  end
end
