class SummitCompletionsController < ApplicationController
  before_action :set_summit_completion, only: [:show, :edit, :update, :destroy]

  # GET /summit_completions
  # GET /summit_completions.json
  def index
    @summit_completions = SummitCompletion.all
  end

  # GET /summit_completions/1
  # GET /summit_completions/1.json
  def show
  end

  # GET /summit_completions/new
  def new
    @summit_completion = SummitCompletion.new
  end

  # GET /summit_completions/1/edit
  def edit
  end

  # POST /summit_completions
  # POST /summit_completions.json
  def create
    @summit_completion = SummitCompletion.new(summit_completion_params)

    respond_to do |format|
      if @summit_completion.save
        format.html { redirect_to @summit_completion, notice: 'Summit completion was successfully created.' }
        format.json { render :show, status: :created, location: @summit_completion }
      else
        format.html { render :new }
        format.json { render json: @summit_completion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /summit_completions/1
  # PATCH/PUT /summit_completions/1.json
  def update
    respond_to do |format|
      if @summit_completion.update(summit_completion_params)
        format.html { redirect_to @summit_completion, notice: 'Summit completion was successfully updated.' }
        format.json { render :show, status: :ok, location: @summit_completion }
      else
        format.html { render :edit }
        format.json { render json: @summit_completion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /summit_completions/1
  # DELETE /summit_completions/1.json
  def destroy
    @summit_completion.destroy
    respond_to do |format|
      format.html { redirect_to summit_completions_url, notice: 'Summit completion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_summit_completion
      @summit_completion = SummitCompletion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def summit_completion_params
      params.require(:summit_completion).permit(:summit, :userId)
    end
end
