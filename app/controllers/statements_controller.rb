class StatementsController < ApplicationController
  
  def index
    @statement = Statement.all
  end

  def new
    @statement = Statement.new
  end

  def create
    @statement = Statement.new(params[:statement])
    @statement.true_or_false == true ? @statement.no_true += 1 : @statement.no_false += 1
    if @statement.save
      redirect_to statements_path
    else
      render :new
    end
  end

  def show
    @statement = Statement.find(params[:id])
  end

end
