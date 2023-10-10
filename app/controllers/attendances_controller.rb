class AttendancesController < ApplicationController
  # before_action :authenticate_staff!
  before_action :set_attendance, only: %i[show edit update destroy]

 # GET /attendances or /attendances.json
 def index
    # @students = Student.joins(admission: :classroom)
    #                 .where(admissions: { admission_status: true }, classrooms: { assign_teacher: "#{current_staff.firstname} #{current_staff.lastname}" })
    @attendance = Attendance.new
    @students = Student.joins(:admission, :classroom)
    .where(admissions: { admission_status: true },
           classrooms: { assign_teacher: "#{current_staff.firstname} #{current_staff.lastname}" })
    @classrooms = Classroom.all

    if teacher? 
      @attendances = Attendance.joins(student: :admission)
                                .where(admissions: { admission_status: true })
                                .order(completed_at: :desc)
    else
      flash[:notice] = "#{current_staff.firstname} #{current_staff.lastname} is not a teacher."
      @attendances = []
    end
      @attendance = Attendance.find_by(params[:id])
  end




  

  # GET /attendances/1 or /attendances/1.json
  def show
    @attendance = Attendance.find(params[:id])
    @students = Student.joins(:admission).where(admissions: { admission_status: true })
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
  @students = Student.all
  student_id = params[:attendance][:student_id]
  
  # Find the student by ID
  @student = Student.find_by(id: student_id)
  
  if @student.nil?
    # Handle the case where the student is not found
    flash[:notice] = 'Student not found'
    redirect_to new_attendance_path
    return
  end
  
  # Associate the found student with the attendance record
  # @attendance.student = @student

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
