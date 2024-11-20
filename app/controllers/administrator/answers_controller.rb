module Administrator
    class AnswersController < Administrator::BaseController
        before_action :set_answer, only: %i[ show edit update destroy ]
        before_action :set_current_admin

        def index
            @answers = Answer.all
        end

        def show
        end

        def new
            @answer = Answer.new
        end
        
        def edit
        end

        def create
            @answer = Answer.new(answer_params)
            @answer.admin_username_id = Current.admin.username

            respond_to do |format|
                if @answer.save
                    format.html { redirect_to administrator_answers_path, notice: "Answer was successfully added." }
                    format.json { render :show, status: :created, location: @answer }
                else
                    format.html { render :new, status: :unprocessable_entity }
                    format.json { render json: @answer.errors, status: :unprocessable_entity }
                end
            end
        end

        def update
            respond_to do |format|
                if @answer.update(answer_params)
                    format.html { redirect_to administrator_answers_path, notice: "Answer was successfully updated." }
                    format.json { render :show, status: :ok, location: @answer }
                else
                    format.html { render :edit, status: :unprocessable_entity }
                    format.json { render json: @answer.errors, status: :unprocessable_entity }
                end
            end
        end

        def destroy
            @answer.destroy!

            respond_to do |format|
                format.html { redirect_to administrator_answers_path, status: :see_other, notice: "Answer was successfully deleted." }
                format.json { head :no_content }
            end
        end

        private
        def set_answer
            @answer = Answer.find(params[:id])
        end

        def answer_params
            params.require(:answer).permit(:answer)
        end
    end
end