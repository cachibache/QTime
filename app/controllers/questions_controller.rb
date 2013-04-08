class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = questions.build(params[:question])
    if @question.save
      redirect_to new_question_path
    else
      render :new
    end
  end
end
