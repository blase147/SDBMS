class ManageSchoolsController < ApplicationController
  before_action :set_manage_school, only: %i[show edit update destroy]

  # GET /manage_schools or /manage_schools.json
  def index
    @manage_schools = ManageSchool.all
    @manage_school = ManageSchool.find_by(id: params[:id])
  end

  # GET /manage_schools/1 or /manage_schools/1.json
  def show
    @manage_school = ManageSchool.find(params[:id])
    @school_logo = @manage_school.school_logo
  end

  # GET /manage_schools/new
  def new
    @manage_school = ManageSchool.new
  end

  # GET /manage_schools/1/edit
  def edit; end

  # POST /manage_schools or /manage_schools.json
  def create
    @manage_school = ManageSchool.new(manage_school_params)

    respond_to do |format|
      if @manage_school.save
        format.html { redirect_to manage_school_url(@manage_school), notice: 'Manage school was successfully created.' }
        format.json { render :show, status: :created, location: @manage_school }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @manage_schools.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage_schools/1 or /manage_schools/1.json
  def update
    respond_to do |format|
      if @manage_school.update(manage_school_params)
        format.html { redirect_to manage_school_url(@manage_school), notice: 'Manage school was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_school }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @manage_schools.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage_schools/1 or /manage_schools/1.json
  def destroy
    @manage_school.destroy

    respond_to do |format|
      format.html { redirect_to manage_schools_url, notice: 'Manage school was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_manage_school
    @manage_school = ManageSchool.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def manage_school_params
    params.require(:manage_school).permit(:school_name, :school_logo, :school_photo, :school_motto, :school_address,
                                          :school_email, :school_phone_number, :school_website, :academic_session, :academic_session_start_date, :academic_session_end_date,
                                          :term, :term_start_date, :term_end_date, :school_name, :school_vision, :school_mission, :academic_session, :hos_signature)
  end

  def set_school_logo
    @school_logo = current_manage_school.school_logo if current_manage_school.present?
  end
end
