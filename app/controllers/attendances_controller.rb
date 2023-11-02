class AttendancesController < ApplicationController
  # before_action :authenticate_staff!
  before_action :set_attendance, only: %i[show edit update destroy]

  # GET /attendances or /attendances.json
  def index
    @students = Student.joins(:admission, :classroom)
      .where(admissions: { admission_status: true })
      .where(classrooms: { assign_teacher: "#{current_staff.firstname} #{current_staff.lastname}" })

    if teacher?
      @attendances = Attendance.joins(student: %i[admission classroom])
        .where(admissions: { admission_status: true })
        .where(classrooms: { assign_teacher: "#{current_staff.firstname} #{current_staff.lastname}" }).order('completed_at ASC')

    else
      flash[:notice] = "#{current_staff.firstname} #{current_staff.lastname} is not a teacher."
      @attendances = []
    end
    @attendances = Attendance.all.order('completed_at DESC')
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

    # Create an empty attendance object for each student
    @attendances = @students.map { |student| Attendance.new(student:) }
  end

  # GET /attendances/1/edit
  def edit
    # @attendance = Attendance.new
    @attendance = Attendance.find(params[:id])
    @students = Student.joins(:admission).where(admissions: { admission_status: true })
  end

  # POST /attendances or /attendances.json
  def create
    # Get common attendance parameters (completed_at) from the form
    attendance_params = params.require(:attendance).permit(:completed_at)

    # Find students based on the teacher and admission status
    students = Student.joins(:admission, :classroom)
      .where(admissions: { admission_status: true },
             classrooms: { assign_teacher: "#{current_staff.firstname} #{current_staff.lastname}" })

    # Initialize an empty array to store the created attendance records
    created_attendances = []

    # Loop through the students and create attendance records for each
    students.each do |student|
      attendance = student.attendances.new(attendance_params)

      # Customize the attendance record here if needed
      attendance.presence = params[:attendance][:presence][student.id.to_s] == '1'
      attendance.health_condition = params[:attendance][:health_condition][student.id.to_s]
      attendance.arrival_time = params[:attendance][:arrival_time][student.id.to_s]
      attendance.departure_time = params[:attendance][:departure_time][student.id.to_s]

      if attendance.save
        created_attendances << attendance
      else
        # Handle validation errors if any
      end
    end

    if created_attendances.empty?
      flash[:alert] = 'No valid attendance records were created.'
      render :new
    else
      flash[:notice] = 'Attendance was successfully created.'
      redirect_to attendances_path
    end
  end


  respond_to do |format|
    if save_successful
      format.html { redirect_to attendances_path, notice: 'Attendances were successfully created.' }
      format.json { render :index, status: :created, location: attendances_path }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @attendance.errors, status: :unprocessable_entity }
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
    params.require(:attendance).permit(:student_id, :classroom_id, :completed_at, :presence, :health_condition,
                                       :arrival_time, :departure_time)
  end
end
