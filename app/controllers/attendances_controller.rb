class AttendancesController < ApplicationController
  # before_action :authenticate_staff!
  before_action :set_attendance, only: %i[show edit update destroy]

 # GET /attendances or /attendances.json
 def index
  @students = Student.joins(:admission, :classroom)
  .where(admissions: { admission_status: true },
         classrooms: { assign_teacher: "#{current_staff.firstname} #{current_staff.lastname}" })

  if teacher?
    @attendances = Attendance.joins(:classroom)
                      .where(classrooms: { assign_teacher: "#{current_staff.firstname} #{current_staff.lastname}" })
                          

  else
    flash[:notice] = "#{current_staff.firstname} #{current_staff.lastname} is not a teacher."
    @attendances = []
  end
    @attendances = Attendance.all
  
end







  

  # GET /attendances/1 or /attendances/1.json
  def show
    @attendance = Attendance.find(params[:id])
    @students = Student.joins(:admission, :classroom)
    .where(admissions: { admission_status: true },
           classrooms: { assign_teacher: "#{current_staff.firstname} #{current_staff.lastname}" })

  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
    @students = Student.joins(:admission, :classroom)
    .where(admissions: { admission_status: true },
           classrooms: { assign_teacher: "#{current_staff.firstname} #{current_staff.lastname}" })
  end

  # GET /attendances/1/edit
  def edit
    # @attendance = Attendance.new
    @attendance = Attendance.find(params[:id])
    @students = Student.joins(:admission).where(admissions: { admission_status: true })
  end

# POST /attendances or /attendances.json
def create
  @attendance = Attendance.new(attendance_params)
  
  # Load @students for rendering the form after create (for potential re-submission)
  @students = Student.joins(:admission, :classroom)
                      .where(admissions: { admission_status: true },
                             classrooms: { assign_teacher: "#{current_staff.firstname} #{current_staff.lastname}" })
  
  # ... rest of your create action code

  respond_to do |format|
    if @attendance.save
      format.html { redirect_to attendance_url(@attendance), notice: 'Attendance was successfully created.' }
      format.json { render :show, status: :created, location: @attendance }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @attendance.errors, status: :unprocessable_entity }
    end
  end
end


# PATCH/PUT /attendances/1 or /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to attendance_url(@attendance), notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1 or /attendances/1.json
  def destroy
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def teacher?
    current_staff.teacher == true
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attendance_params
    params.require(:attendance).permit(:student_id, :classroom_id, :completed_at, :presence, :health_condition, :arrival_time, :departure_time )
  end
end
