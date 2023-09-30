class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]

  def students_portal
    # Your logic here to prepare data for the view
    render 'students_portal' # This should match your view file name
  end

  # GET /students or /students.json
  def index
    @students = Student.all
    @admitted_students = Student.where(admission_status: true)
    # @students = Student.joins(:admission).where(admissions: { admission_status: true })
    # @admitted_students = Student.where(admission_id: @student.admission_id, admission_status: true)
  #  @admitted_students = @student.admission if @student.admission&.admission_status
  end

  # GET /students/1 or /students/1.json
# students_controller.rb

def show
  @student = Student.find(params[:id])
  # @admitted_students = Student.where(admission_status: true)
  @admitted_students = Student.where(admission_id: @student.admission_id, admission_status: true)
  # @admitted_student = Student.find(params[:id])
end


# GET /students/new
def new
  @student = Student.new
  @classrooms = Classroom.all

  # Fetch admitted students
  @admitted_students = Admission.where(admission_status: true).select(Arel.sql("CONCAT(admissions.firstname, ' ', admissions.lastname) AS fullname, admissions.id"))

  # Fetch uncreated students (students without a user account)
  @uncreated_students = Student.left_outer_joins(:admission).where(admissions: { id: nil }).select(Arel.sql("CONCAT(students.firstname, ' ', students.lastname) AS fullname, students.id AS id"))

  # Combine admitted and uncreated students into a single collection
  @students_collection = @admitted_students + @uncreated_students
end


  
  

  # GET /students/1/edit
  def edit; end

# POST /students or /students.json
def create
  @student = Student.new(student_params)

  # Find the admission you want to link to
  admission = Admission.find_by(id: params[:student][:admission_id])

  # Link the student to the admission
  @student.admission = admission

  # Fetch admitted students
  @admitted_students = Admission.where(admission_status: true).select(Arel.sql("CONCAT(admissions.firstname, ' ', admissions.lastname) AS fullname, admissions.id"))

  # Fetch uncreated students (students without a user account)
  @uncreated_students = Student.left_outer_joins(:admission).where(students: { id: nil }).select(Arel.sql("CONCAT(students.firstname, ' ', students.lastname) AS fullname, students.id AS id"))

  # Combine admitted and uncreated students into a single collection
  @students_collection = @admitted_students + @uncreated_students

   # Initialize the @classrooms variable
   @classrooms = Classroom.all

  respond_to do |format|
    if @student.save
      format.html { redirect_to student_url(@student), notice: 'Student was successfully created.' }
      format.json { render :show, status: :created, location: @student }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @student.errors, status: :unprocessable_entity }
    end
  end
end



  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:admission_number, :admission_date, :registration_date, :admission_id, :classroom_id, :disabilities, :disability_type)
  end
end
