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
    @students = Student.joins(:admission, :classroom)
      .where(admissions: { admission_status: true },
             classrooms: { assign_teacher: "#{current_staff.firstname} #{current_staff.lastname}" })
  end

  # POST /attendances or /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)
    # Find students based on the teacher and admission status
    Student.joins(:admission, :classroom)
      .where(admissions: { admission_status: true },
             classrooms: { assign_teacher: "#{current_staff.firstname} #{current_staff.lastname}" }).distinct

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to attendances_url(@attendances), notice: 'Attendance was successfully created.' }
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
    params.require(:attendance).permit(:student_id, :classroom_id, :completed_at, :presence, :health_condition,
                                       :arrival_time, :departure_time)
  end
end
