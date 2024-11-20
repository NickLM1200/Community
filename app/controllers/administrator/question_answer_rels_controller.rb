module Administrator
    class QuestionAnswerRelsController < Administrator::BaseController
        before_action :set_question_answer_rel, only: %i[ show edit update destroy ]
        before_action :set_current_admin

        def index
            @question_answer_rels = QuestionAnswerRel.all
        end

        def show
        end

        def new
            @question_answer_rel = QuestionAnswerRel.new
        end

        def edit
        end

        def create
            @question_answer_rel = QuestionAnswerRel.new(question_answer_rel_params)
            @question_answer_rel.admin_username = Current.admin.username

            respond_to do |format|
                if @question_answer_rel.save
                    format.html { redirect_to administrator_question_answer_rels_path, notice: "Relation was successfully created." }
                    format.json { render :show, status: :created, location: @question_answer_rel }
                else
                    format.html { render :new, status: :unprocessable_entity }
                    format.json { render json: @question_answer_rel.errors, status: :unprocessable_entity }
                end
            end
        end

        def update
            respond_to do |format|
                if @question_answer_rel.update(question_answer_rel_params)
                    format.html { redirect_to administrator_question_answer_rels_path, notice: "Relation was successfully updated." }
                    format.json { render :show, status: :ok, location: @question_answer_rel }
                else
                    format.html { render :edit, status: :unprocessable_entity }
                    format.json { render json: @question_answer_rel.errors, status: :unprocessable_entity }
                end
            end
        end

        def destroy
            if @question_answer_rel.destroy
                respond_to do |format|
                    format.html { redirect_to administrator_question_answer_rels_path, status: :see_other, notice: "Relation was successfully destroyed." }
                    format.json { head :no_content }
                end
            else
                respond_to do |format|
                    format.html { redirect_to administrator_question_answer_rels_path, status: :unprocessable_entity, notice: "Relation was not successfully destroyed." }
                    format.json { render json: @question_answer_rel.errors, status: :unprocessable_entity }
                end
            end
        end

        private
        def set_question_answer_rel
            @question_answer_rel = QuestionAnswerRel.find(params[:id])
        end

        def question_answer_rel_params
            params.require(:question_answer_rel).permit(:questionID, :answerID)
        end
    end
end