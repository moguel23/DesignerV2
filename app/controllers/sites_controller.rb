class SitesController < ApplicationController
  def new
    @customer = Customer.find(params[:customer])
    @site = Site.new
  end

  def create
    @customer = Customer.find(params[:customer])
    @site = @customer.sites.build(site_params)
    if @site.save
      flash[:success] = "Site Created"
      redirect_to customer_path(@customer)
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @site = Site.find(params[:id])
    @customer = @site.customer
  end

  def index
  end

  def update
  end

  def destroy
  end


  #DEFINE PARAMETERS
  private
  def site_params
    params.require(:site).permit(:name, :code, :site_type, :total_users)
  end
end
