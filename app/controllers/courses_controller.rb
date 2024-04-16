class CoursesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @courses = Course.all
    render json: @courses
  end

  def show
    @course = Course.find(params[:id])
    render json: @course
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:course_name, :description, :price, :discounted_price, :live_classes, :quizzes, :projects, :doubt_support, :interview_questions_covered, :lifetime_access, :image_url)
  end
end
