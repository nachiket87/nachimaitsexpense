class TransactionsController < ActionController::Base
  before_action :set_transactions

  def create
    @transaction = Transaction.new(amount: permitted_params[:amount])

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to root_path }
      else
        format.html { render 'home/index', status: :unprocessable_entity}
      end
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
