class StatementsController < ApplicationController
  
  before_filter :authenticate, :except => [:index]

  respond_to :html, :js

  def index
    respond_with(@statement = Statement.all)
  end

  def new
    respond_with(@statement = Statement.new)
  end

  def create
    @statement = Statement.new(params[:statement])
    if @statement.save
      respond_with(@statement, :location => statements_path)
    else
      render :new
    end
  end

  def show
    respond_with(@statement = Statement.find(params[:id]))
  end

  def edit
    respond_with(@statement = Statement.find(params[:id]))
  end

  def update
    @statement = Statement.find(params[:id])
    if @statement.update_attributes(params[:statement])
      respond_with(@statement, :location => statement_path)
    else
      render :edit
    end
  end

  def destroy
  end

  def vote_true
    @statement = Statement.find(params[:id])
    vote = current_user.vote_exclusively_for(@statement)
    redirect_to statements_path
  end

  def vote_false
    @statement = Statement.find(params[:id])
    vote = current_user.vote_exclusively_against(@statement)
    redirect_to statements_path
  end
end
