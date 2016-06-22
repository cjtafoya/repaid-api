class Api::V1::ExpensesController < ApplicationController

  def index
    render json: Expense.all
  end

  def show
    render json: expense
  end

  def create
    expense = Expense.create(expense_params)
    create_expense_updates(expense)
    render json: expense
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
    output = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    output.delete(:gathering_id) if output.keys.include?(:gathering_id)
    output
  end

  def create_expense_updates(expense)
    attendee = Attendee.find(expense.attendee_id)
    attendee.update_expenses(expense.amount)

    group = Group.find(expense.group_id)
    group.update_expense_per_person
    group.update_attendee_balances

    attendee.update_balance if !attendee.groups.include?(group)
  end

end
