class DemandsController < ApplicationController
  def index
    @demands = Demand.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @demand }
    end
  end

  def show
    @demand = Demand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @demand }
    end
  end

  def new
    @demand = Demand.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @demand }
    end
  end

 # GET /sources/1/edit
  def edit
    @demand = Demand.find(params[:id])
  end

  # POST /sources
  # POST /sources.json
  def create
    @demand = Demand.new(params[:demand])

    respond_to do |format|
      if @demand.save
        format.html { redirect_to @demand, notice: 'Demand was successfully created.' }
        format.json { render json: @demand, status: :created, location: @demand }
      else
        format.html { render action: "new" }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sources/1
  # PUT /sources/1.json
  def update
    @demand = Demand.find(params[:id])

    respond_to do |format|
      if @demand.update_attributes(params[:demand])
        format.html { redirect_to @demand, notice: 'Demand was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
    @demand = Demand.find(params[:id])
    @demand.destroy

    respond_to do |format|
      format.html { redirect_to demands_url }
      format.json { head :ok }
    end
  end
end

