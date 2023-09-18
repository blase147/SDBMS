class Staffs::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  prepend_before_action :require_no_authentication, only: [:new, :edit, :update]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # GET /resource/sign_up
 def new
  @staff = Staff.new
  @departments = Department.all
  super
  # render 'staffs/registrations/new'
end

  # POST /staffs
  def create
    @staff = Staff.new(staff_params)
    @departments = Department.all # Assuming you have a Department model and want to populate the dropdown with department names
    # @staff.roles = params[:staff][:roles]

    respond_to do |format|
      if @staff.save
        format.html { redirect_to staff_url(@staff), notice: 'Staff was successfully created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /resource/edit
  def edit
    @departments = Department.all
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[designation photo title firstname lastname email password phone dateofbirth country
                                                         state lga street department_id salary hire_date teacher administrator human_resource frontdesk chef accountant librarian principal vice_principal bursar guidance_counselor nurse security cleaner driver other roles: []])
  end

  def staff_params
    params.require(:staff).permit(:designation, :photo, :title, :firstname, :lastname, :email, :password, :phone, :dateofbirth, :country,
                                  :state, :lga, :street, :department_id, :salary, :hire_date, :teacher, :administrator, :human_resource, 
                                  :frontdesk, :chef, :accountant, :librarian, :principal, :vice_principal, :bursar, :guidance_counselor,
                                   :nurse, :security, :cleaner, :driver, :other, roles: []
                                   ).tap do |whitelisted|
                                      # Convert role names to Role instances and assign them to the staff
                                      whitelisted[:roles] = params[:staff][:roles].map do |role_name|
                                        Role.find_or_create_by(name: role_name)
                                      end
                                   end
  end

end
