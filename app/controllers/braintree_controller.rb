class BraintreeController < ApplicationController

  def new

    @user = User.find(params[:user_id])
    @client_token = Braintree::ClientToken.generate
    # @user = User.find(params[:id])
  end

  def payment

    @user = User.find(params[:user_id])

  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

  result = Braintree::Transaction.sale(
     :amount => "1", #this is currently hardcoded
     :payment_method_nonce => nonce_from_the_client,
     :options => {
       :submit_for_settlement => true
    }
   )
    if result.success?
      @user.update(:verification => 1)
      flash[:success] = "Account successfully verified!"
      redirect_to root_path
    else
      flash[:error] = "Verification was unsuccessful, please try again."
      redirect_to new_verification_path
    end
  end
end
