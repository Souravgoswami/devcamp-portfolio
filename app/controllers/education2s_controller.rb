class Education2sController < ApplicationController
  before_action :set_education2, only: [:show, :edit, :update, :destroy]

  # GET /education2s
  # GET /education2s.json
  def index
    @education2s = Education2.all
  end

  # GET /education2s/1
  # GET /education2s/1.json
  def show
  end

  # GET /education2s/new
  def new
    @education2 = Education2.new
  end

  # GET /education2s/1/edit
  def edit
  end

  # POST /education2s
  # POST /education2s.json
  def create
    @education2 = Education2.new(education2_params)

    respond_to do |format|
      if @education2.save
        format.html { redirect_to @education2, notice: 'Education2 was successfully created.' }
        format.json { render :show, status: :created, location: @education2 }
      else
        format.html { render :new }
        format.json { render json: @education2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /education2s/1
  # PATCH/PUT /education2s/1.json
  def update
    respond_to do |format|
      if @education2.update(education2_params)
        format.html { redirect_to @education2, notice: 'Education2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @education2 }
      else
        format.html { render :edit }
        format.json { render json: @education2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /education2s/1
  # DELETE /education2s/1.json
  def destroy
    @education2.destroy
    respond_to do |format|
      format.html { redirect_to education2s_url, notice: 'Education2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education2
      @education2 = Education2.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def education2_params
      params.require(:education2).permit(:body, :title)
    end
end
