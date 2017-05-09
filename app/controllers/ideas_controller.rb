class IdeasController < ProtectedController
  before_action :set_idea, only: [:show, :update, :destroy]

  # GET /ideas
  def index
    @ideas = current_user.ideas

    render json: @ideas
  end

  # GET /ideas/1
  def show
    render json: @idea
  end

  # POST /ideas
  def create
    @idea = current_user.ideas.build(idea_params)

    if @idea.save
      render json: @idea, status: :created, location: @idea
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ideas/1
  def update
    if @idea.update(idea_params)
      head :no_content
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ideas/1
  def destroy
    @idea.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = current_user.ideas.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def idea_params
      params.require(:idea).permit(:content)
    end
end
