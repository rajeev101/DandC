class LearningsController < ApplicationController
   before_action :set_user, only:[:show]
  def index
    @courses = Course.all
    @faqs = Faq.all
    @instructors = Instructor.all
    @recommendations = Recommendation.all
    @contacts = Contact.all
    @registrations = Registration.all
    @registration = Registration.new

  end

  def more
    @categories = Category.all
    @subcategories = Subcategory.all
    @super_sub_categories = SuperSubCategory.all
    @registrations = Registration.all
    @registration = Registration.new
  end



  def create
    registration = Registration.new(registration_params)

    respond_to do |format|
      if registration.save
        SendMailer.send_email(registration.email, registration).deliver_now
        format.html { redirect_to root_path, notice: 'Registration successful. Confirmation email sent.' }
        format.json { render json: { success: true, message: 'Registration successful. Confirmation email sent.' } }
      else
        format.html { render :index }
        format.json { render json: { success: false, errors: registration.errors.full_messages } }
      end
    end
  end
  def show

  end

  private
  def set_user
     @registration = Registration.find(params[:id])
  end

    def registration_params
      params.require(:registration).permit(:your_name, :email, :phone_number, :course_of_interest, :message)
    end
end
