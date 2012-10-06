class ProjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /projects
  # GET /projects.json
  
  def index

   @projects = Project.order("title").page(params[:page]).per(3)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    if params[:tag]
        @links = Link.tagged_with(params[:tag])
      else
        @Links = Link.all
      end
    @project = Project.find(params[:id])
    @user_who_linked = @current_user
    @link = Link.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # project /projects
  # project /projects.json
  def create
    @project = Project.new(params[:project])
    
    if @project.save
    			flash[:notice] = "project created."
    			redirect_to :action => "show", :id => @project.id
    		else
    			render('new')
    		end
    		
    #respond_to do |format|
      #if @project.save
        #format.html { redirect_to @project, notice: 'project was successfully created.' }
        #format.json { render json: @project, status: :created, location: @project }
      #else
        #format.html { render action: "new" }
        #format.json { render json: @project.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end