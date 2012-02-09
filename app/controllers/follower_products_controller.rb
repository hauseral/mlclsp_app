class FollowerProductsController < ApplicationController
  # GET /follower_products
  # GET /follower_products.json
  def index
    @follower_products = FollowerProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @follower_products }
    end
  end

  # GET /follower_products/1
  # GET /follower_products/1.json
  def show
    @follower_product = FollowerProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @follower_product }
    end
  end

  # GET /follower_products/new
  # GET /follower_products/new.json
  def new
    @follower_product = FollowerProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @follower_product }
    end
  end

  # GET /follower_products/1/edit
  def edit
    @follower_product = FollowerProduct.find(params[:id])
  end

  # POST /follower_products
  # POST /follower_products.json
  def create
    @follower_product = FollowerProduct.new(params[:follower_product])

    respond_to do |format|
      if @follower_product.save
        format.html { redirect_to(@follower_product, :notice => 'Follower product was successfully created.') }
        format.json  { render :json => @follower_product, :status => :created, :location => @follower_product }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @follower_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /follower_products/1
  # PUT /follower_products/1.json
  def update
    @follower_product = FollowerProduct.find(params[:id])

    respond_to do |format|
      if @follower_product.update_attributes(params[:follower_product])
        format.html { redirect_to(@follower_product, :notice => 'Follower product was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @follower_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /follower_products/1
  # DELETE /follower_products/1.json
  def destroy
    @follower_product = FollowerProduct.find(params[:id])
    @follower_product.destroy

    respond_to do |format|
      format.html { redirect_to(follower_products_url) }
      format.json  { head :ok }
    end
  end
end
