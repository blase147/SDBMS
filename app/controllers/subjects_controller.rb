class SubjectstsController < ApplicationController
  before_action :set_subjectst, only: %i[ show edit update destroy ]

  # GET /subjectsts or /subjectsts.json
  def index
    @subjectsts = Subjectst.all
  end

  # GET /subjectsts/1 or /subjectsts/1.json
  def show
  end

  # GET /subjectsts/new
  def new
    @subjectst = Subjectst.new
  end

  # GET /subjectsts/1/edit
  def edit
  end

  # POST /subjectsts or /subjectsts.json
  def create
    @subjectst = Subjectst.new(subjectst_params)

    respond_to do |format|
      if @subjectst.save
        format.html { redirect_to subjectst_url(@subjectst), notice: "Subjectst was successfully created." }
        format.json { render :show, status: :created, location: @subjectst }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subjectst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjectsts/1 or /subjectsts/1.json
  def update
    respond_to do |format|
      if @subjectst.update(subjectst_params)
        format.html { redirect_to subjectst_url(@subjectst), notice: "Subjectst was successfully updated." }
        format.json { render :show, status: :ok, location: @subjectst }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subjectst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjectsts/1 or /subjectsts/1.json
  def destroy
    @subjectst.destroy

    respond_to do |format|
      format.html { redirect_to subjectsts_url, notice: "Subjectst was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subjectst
      @subjectst = Subjectst.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subjectst_params
      params.require(:subjectst).permit(:name)
    end
end
