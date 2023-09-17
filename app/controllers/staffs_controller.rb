class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :set_departments, only: [:new, :edit]
 
  # GET /staffs or /staffs.json
  def index
    @staffs = Staff.all
  end

  # GET /staffs/1 or /staffs/1.json
  def show
    # @staff = Staff.find(params[:id])
    # Other code related to the show action
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
    @departments = Department.all 
  end

  # GET /staffs/1/edit
  def edit
    @staff = Staff.find(params[:id])
  end
  

  # POST /staffs or /staffs.json
def create
  # authorize! :manage, @staff
  @staff = Staff.new(staff_params)
  @staff.roles = params[:staff][:roles] # Assign roles before saving
  
  respond_to do |format|
    if @staff.save
      # Assign roles after saving the staff member
      @staff.update(roles: params[:staff][:roles])
      
      format.html { redirect_to staffs_path(@staff), notice: 'Staff was successfully created.' }
      format.json { render :show, status: :created, location: @staff }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @staff.errors, status: :unprocessable_entity }
    end
  end
end


  # PATCH/PUT /staffs/1 or /staffs/1.json
  def update
    # @staff = Staff.find(params[:id])

    @staff.roles = params[:staff][:roles] if params[:staff][:roles]

    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to staffs_path(@staff), notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1 or /staffs/1.json
  def destroy
    @staff.destroy

    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to staffs_path, notice: "You are not authorized to perform this action."
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_staff
    @staff = Staff.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def staff_params
    params.require(:staff).permit(:designation, :photo, :title, :firstname, :lastname, :email, :password, :phone, :dateofbirth, :country,
                                  :state, :lga, :street, :department_id, :salary, :hire_date, :teacher, :administrator, :human_resource, :frontdesk, :chef, :accountant, :librarian, :principal, :vice_principal, :bursar, :guidance_counselor, :nurse, :security, :cleaner, :driver, :other, roles: [])
  end

  # Use @staff instead of current_user in the current_ability method
  def current_ability
    @current_ability ||= ::Ability.new(@staff)
  end

  def set_departments
    @departments = Department.all
  end
end
