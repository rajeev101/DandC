class SyllabusController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @syllabuse = Syllabus.all
    render json: @syllabuses
  end

  def show
    @syllabus = Syllabus.find(params[:id])
  end


  def create
    @syllabus = Syllabus.new(syllabus_params)

    if @syllabus.save
      render json: @syllabus, status: :created
    else
      render json: { errors: @syllabus.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def syllabus_params
    params.require(:syllabus).permit(:description, :title, :course_id)
  end
end

