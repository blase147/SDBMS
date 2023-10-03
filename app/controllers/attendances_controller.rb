class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[show edit update destroy]

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all.order(completed_at: :desc)
    @students = Student.joins(:admission).where(admissions: { admission_status: true })
    
    # Find or create an attendance record for today
    @attendance = Attendance.find_or_create_by(completed_at: Date.today)
  
    # Calculate the number of students present and absent
    present_students_count = @attendances.where(presence: true).count
    absent_students_count =  @attendances.where(presence: false).count
  
    # Pass these counts to your view
    @absent_students_count = absent_students_count
    @present_students_count = present_students_count

      # Calculate the number of male and female students
    male_students_count = @students.where(admissions: { gender: 'Male' }).count
    female_students_count = @students.where(admissions: { gender: 'Female' }).count

    # Pass these counts to your view
    @male_students_count = male_students_count
    @female_students_count = female_students_count
  end
  

  # GET /attendances/1 or /attendances/1.json
  def show
    @attendance = Attendance.find(params[:id])
    @students = Student.joins(:admission).where(admissions: { admission_status: true })
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
    @students = Student.joins(:admission).where(admissions: { admission_status: true })
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
  @attendance.student = @student

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

  # Use callbacks to share common setup or constraints between actions.
  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attendance_params
    params.require(:attendance).permit(:student_id, :completed_at, :presence, :health_condition, :arrival_time, :departure_time )
  end
end
