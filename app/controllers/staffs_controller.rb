class StaffsController < ApplicationController
  # before_action :authenticate_staff!
  before_action :set_staff, only: %i[show edit update destroy]

  # GET /staffs or /staffs.json
  def index
    @staffs = Staff.all
  end

  # GET /staffs/1 or /staffs/1.json
  def show
    puts "params[:id]: #{params[:id]}"
    @staff = Staff.find(params[:id])
    # Other code related to the show action
  end


  # GET /staffs/new
  def new
    @staff = Staff.new
    @departments = Department.all # Assuming you have a Department model and want to populate the dropdown with department names
  end



  # GET /staffs/1/edit
  def edit; end

  # POST /staffs or /staffs.json
  def create
    @staff = Staff.new(staff_params)
    @departments = Department.all # Assuming you have a Department model and want to populate the dropdown with department names

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

  # PATCH/PUT /staffs/1 or /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to staff_url(@staff), notice: 'Staff was successfully updated.' }
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_staff
    @staff = Staff.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def staff_params
    params.require(:staff).permit(:designation, :photo, :title, :firstname, :lastname, :email, :password, :phone, :dateofbirth, :country,
                                  :state, :lga, :street, :department_id, :salary, :hire_date, :teacher, :administrator, :human_resource, :frontdesk, :chef, :accountant, :librarian, :principal, :vice_principal, :bursar, :guidance_counselor, :nurse, :security, :cleaner, :driver, :other)
  end
end
