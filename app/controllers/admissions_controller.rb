class AdmissionsController < ApplicationController
  before_action :set_admission, only: %i[show edit update destroy]

  # GET /admissions or /admissions.json
  def index
    @admissions = Admission.all
  end

  # GET /admissions/1 or /admissions/1.json
  def show
    @admission = Admission.find(params[:id])
  end
  

  # GET /admissions/new
  def new
    @admission = Admission.new
    # @admission.transcript.attach(params[:admission][:transcript])
    # @admission.photo.attached(params[:admission][:photo])
  end

  # GET /admissions/1/edit
  def edit; end

  # POST /admissions or /admissions.json
  def create
    @admission = Admission.new(admission_params)
    @admission.photo.attached(params[:admission][:photo])

    respond_to do |format|
      if @admission.save
        format.html { redirect_to admission_url(@admission), notice: 'Admission was successfully created.' }
        format.json { render :show, status: :created, location: @admission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admissions/1 or /admissions/1.json
  def update
    @admission.photo.attached(params[:admission][:photo])

    respond_to do |format|
      if @admission.update(admission_params)
        format.html { redirect_to admission_url(@admission), notice: 'Admission was successfully updated.' }
        format.json { render :show, status: :ok, location: @admission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admissions/1 or /admissions/1.json
  def destroy
    @admission = Admission.find(params[:id])
    @admission.destroy

    respond_to do |format|
      format.html { redirect_to admissions_url, notice: 'Admission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /admissions/1/toggle_status
  def toggle_status
    @admission = Admission.find(params[:id])
    if @admission.update_attribute(:admission_status, !@admission.admission_status)
      redirect_to admissions_path, notice: 'Admission status was successfully changed.'
    else
      redirect_to admissions_path, alert: 'Failed to update admission status.'
    end
  end
  
  
  


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admission
    @admission = Admission.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def admission_params
    params.require(:admission).permit(:reg_number, :firstname, :lastname, :other_names, :date_of_birth, :admission_date, :gender, :country, :state, :lga,
                                      :phone, :email, :level, :transcript, :photo, :primary_language, :other_languages, :religion, 
                                      :current_school_name, :type_of_school, :current_class_year, :current_school_address,
                                      :relationship_with_applicant, :p_full_name, :p_date_of_birth, :p_country_of_birth,:p_photo, 
                                      :p_title, :p_nationality, :p_occupation, :p_home_address, :p_mailing_address,
                                      :p_mobile_phone_number, :p_email, :p_employer_name, :p_employer_address, :p_work_telephone_number,
                                      :p_email
                                       )
  end
end

