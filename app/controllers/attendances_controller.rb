class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[show edit update destroy]

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
    @students = Student.joins(:admission).where(admissions: { admission_status: true })
    # @attendance = Attendance.new
    @attendance = Attendance.find_or_create_by(completed_at: Date.today)

    # Assuming you have a way to determine whether a student is absent or present
    absent_students_count = @students.select { |student| student.presence }.count
    present_students_count = @students.count - absent_students_count

    # Pass these counts to your view
    @absent_students_count = absent_students_count
    @present_students_count = present_students_count
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
    @attendance.completed_at = Time.now

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
    params.require(:attendance).permit(:created_at, :presence, :health_condition, :arrival_time, :departure_time )
  end
end
