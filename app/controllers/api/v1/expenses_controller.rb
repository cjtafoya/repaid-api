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
    name = params.require(:data).require(:attributes).require(:name)
    amount = params.require(:data).require(:attributes).require(:amount)
    groupid = params.require(:data).require(:relationships).require(:group).require(:data).require(:id)
    attendeeid = params.require(:data).require(:relationships).require(:attendee).require(:data).require(:id)
    { name: name, amount: amount, attendee_id: attendeeid, group_id: groupid }
  end

end
