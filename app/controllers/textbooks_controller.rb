class TextbooksController < ApplicationController
  before_action :set_textbook, only: %i[show edit update destroy]

  # GET /textbooks or /textbooks.json
  def index
    @textbooks = Textbook.all
  end

  # GET /textbooks/1 or /textbooks/1.json
  def show; end

  # GET /textbooks/new
  def new
    @textbook = Textbook.new
  end

  # GET /textbooks/1/edit
  def edit; end

  # POST /textbooks or /textbooks.json
  def create
    @textbook = Textbook.new(textbook_params)

    respond_to do |format|
      if @textbook.save
        format.html { redirect_to textbook_url(@textbook), notice: 'Textbook was successfully created.' }
        format.json { render :show, status: :created, location: @textbook }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /textbooks/1 or /textbooks/1.json
  def update
    respond_to do |format|
      if @textbook.update(textbook_params)
        format.html { redirect_to textbook_url(@textbook), notice: 'Textbook was successfully updated.' }
        format.json { render :show, status: :ok, location: @textbook }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /textbooks/1 or /textbooks/1.json
  def destroy
    @textbook.destroy

    respond_to do |format|
      format.html { redirect_to textbooks_url, notice: 'Textbook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_textbook
    @textbook = Textbook.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def textbook_params
    params.require(:textbook).permit(:title, :description, :level, :publisher, :year_of_publication, :authur)
  end
end
