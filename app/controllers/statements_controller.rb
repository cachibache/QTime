class StatementsController < ApplicationController
  
  def index
    @statement = Statement.all
  end

  def new
    @statement = Statement.new
  end

  def create
    render :new unless params[:answer].downcase.strip! == 'true' || 'false'
    params[:answer] = params[:answer].downcase.strip!
    @statement = Statement.new(params[:statement])
    if @statement.save
      redirect_to statements_path
    else
      render :new
    end
  end

end
