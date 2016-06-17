class Api::V1::ExpensesController < ApplicationController

  def index
    render json: Expense.all
  end

  def show
    render json: expense
  end

  def create
    render json: Expense.create(expense_params)
  end

  def update
    render json: expense.update(expense_params)
  end

  def destroy
    render json: expense.destroy
  end

  private

  def expense
    Expense.find(params[:id])
  end

  def expense_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

end
