class CorrespondencesController < ApplicationController
  before_action :set_correspondence, only: %i[show edit update destroy]

  # GET /correspondences or /correspondences.json
  def index
    @correspondences = Correspondence.all
  end

  # GET /correspondences/1 or /correspondences/1.json
  def show; end

  # GET /correspondences/new
  def new
    @correspondence = Correspondence.new
  end

  # GET /correspondences/1/edit
  def edit; end

  # POST /correspondences or /correspondences.json
  def create
    @correspondence = Correspondence.new(correspondence_params)

    respond_to do |format|
      if @correspondence.save
        format.html do
          redirect_to correspondence_url(@correspondence), notice: 'Correspondence was successfully created.'
        end
        format.json { render :show, status: :created, location: @correspondence }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @correspondence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /correspondences/1 or /correspondences/1.json
  def update
    respond_to do |format|
      if @correspondence.update(correspondence_params)
        format.html do
          redirect_to correspondence_url(@correspondence), notice: 'Correspondence was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @correspondence }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @correspondence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /correspondences/1 or /correspondences/1.json
  def destroy
    @correspondence.destroy

    respond_to do |format|
      format.html { redirect_to correspondences_url, notice: 'Correspondence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_correspondence
    @correspondence = Correspondence.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def correspondence_params
    params.require(:correspondence).permit(:firstname, :lastname, :other_names, :photo, :teachers_remark)
  end
end
