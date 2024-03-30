class TransactionsController < ActionController::Base
  before_action :set_transactions

  def create

    @transaction = Transaction.new(amount: permitted_params[:amount])

    if @transaction.save
      redirect_to root_path
    else
      render 'home/index'
    end
  end

  private

  def permitted_params
    params.require(:transaction).permit(:amount)
  end

  def set_transactions
    @last_months_transactions = Transaction.where(created_at: (Time.now.beginning_of_month - 1.month)..(Time.now.beginning_of_month - 1.second))
    @this_months_transactions = Transaction.where(created_at: Time.now.beginning_of_month..Time.now)
  end

end
