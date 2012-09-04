class WorkActivitiesController < ApplicationController
  # GET /work_activities
  # GET /work_activities.json
  def index
    @work_activities = WorkActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_activities }
    end
  end

  # GET /work_activities/1
  # GET /work_activities/1.json
  def show
    @work_activity = WorkActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_activity }
    end
  end

  # GET /work_activities/new
  # GET /work_activities/new.json
  def new
    @work_activity = WorkActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_activity }
    end
  end

  # GET /work_activities/1/edit
  def edit
    @work_activity = WorkActivity.find(params[:id])
  end

  # POST /work_activities
  # POST /work_activities.json
  def create
    @work_activity = WorkActivity.new(params[:work_activity])

    respond_to do |format|
      if @work_activity.save
        format.html { redirect_to @work_activity, notice: 'Work activity was successfully created.' }
        format.json { render json: @work_activity, status: :created, location: @work_activity }
      else
        format.html { render action: "new" }
        format.json { render json: @work_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_activities/1
  # PUT /work_activities/1.json
  def update
    @work_activity = WorkActivity.find(params[:id])

    respond_to do |format|
      if @work_activity.update_attributes(params[:work_activity])
        format.html { redirect_to @work_activity, notice: 'Work activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_activities/1
  # DELETE /work_activities/1.json
  def destroy
    @work_activity = WorkActivity.find(params[:id])
    @work_activity.destroy

    respond_to do |format|
      format.html { redirect_to work_activities_url }
      format.json { head :no_content }
    end
  end
end
