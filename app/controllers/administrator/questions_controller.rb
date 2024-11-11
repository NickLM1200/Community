module Administrator
  class QuestionsController < Administrator::BaseController
    before_action :set_question, only: %i[ show edit update destroy ]
    before_action :set_current_admin

    # GET /questions or /questions.json
    def index
      @questions = Question.all
    end

    # GET /questions/1 or /questions/1.json
    def show
    end

    # GET /questions/new
    def new
      @question = Question.new
    end

    # GET /questions/1/edit
    def edit
    end

    # POST /questions or /questions.json
    def create
      @question = Question.new(question_params)
      @question.admin_username = Current.admin.username

      respond_to do |format|
        if @question.save
          format.html { redirect_to administrator_questions_path, notice: "Question was successfully added." }
          format.json { render :show, status: :created, location: @question }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /questions/1 or /questions/1.json
    def update
      respond_to do |format|
        if @question.update(question_params)
          format.html { redirect_to administrator_questions_path, notice: "Question was successfully updated." }
          format.json { render :show, status: :ok, location: @question }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /questions/1 or /questions/1.json
    def destroy
      @question.destroy!

      respond_to do |format|
        format.html { redirect_to administrator_questions_path, status: :see_other, notice: "Question was successfully deleted." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_question
        @question = Question.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def question_params
        params.require(:question).permit(:question)
      end
  end
end