class ResourcePeriodsController < ApplicationController
  # GET /resource_periods
  # GET /resource_periods.json
  def index
    @resource_periods = ResourcePeriod.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @resource_periods }
    end
  end

  # GET /resource_periods/1
  # GET /resource_periods/1.json
  def show
    @resource_period = ResourcePeriod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @resource_period }
    end
  end

  # GET /resource_periods/new
  # GET /resource_periods/new.json
  def new
    @resource_period = ResourcePeriod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @resource_period }
    end
  end

  # GET /resource_periods/1/edit
  def edit
    @resource_period = ResourcePeriod.find(params[:id])
  end

  # POST /resource_periods
  # POST /resource_periods.json
  def create
    @resource_period = ResourcePeriod.new(params[:resource_period])

    respond_to do |format|
      if @resource_period.save
        format.html { redirect_to(@resource_period, :notice => 'Resource period was successfully created.') }
        format.json  { render :json => @resource_period, :status => :created, :location => @resource_period }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @resource_period.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /resource_periods/1
  # PUT /resource_periods/1.json
  def update
    @resource_period = ResourcePeriod.find(params[:id])

    respond_to do |format|
      if @resource_period.update_attributes(params[:resource_period])
        format.html { redirect_to(@resource_period, :notice => 'Resource period was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @resource_period.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_periods/1
  # DELETE /resource_periods/1.json
  def destroy
    @resource_period = ResourcePeriod.find(params[:id])
    @resource_period.destroy

    respond_to do |format|
      format.html { redirect_to(resource_periods_url) }
      format.json  { head :ok }
    end
  end
end
