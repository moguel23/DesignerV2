class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.paginate(page: params[:page], :per_page => 5)
  end

  def update
  end

  def destroy
  end


  # DEFINE PARAMETERS
  private
  def customer_params
    params.require(:customer).permit(:name, :code)
  end
end
