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
    groupid = params.require(:data).require(:attributes).require("group-id")
    attendeeid = params.require(:data).require(:attributes).require("attendee-id")
    { name: name, amount: amount, group_id: groupid, attendee_id: attendeeid }
  end

end
