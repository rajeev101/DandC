class RegistrationController < ApplicationController
	skip_before_action :verify_authenticity_token
  before_action :set_user, only:[:show,:edit,:update,:destroy ]

	def index
		@registrations = Registration.all
    render json: @registration, status: :ok
    @registration = Registration.new 
	end


  
   def create
    registration = Registration.new(registration_params)

    if registration.save
      SendMailer.send_email(registration.email, registration).deliver_now

      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Registration successful. Confirmation email sent.' }
        format.js 
      end
    else
      render :index
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


