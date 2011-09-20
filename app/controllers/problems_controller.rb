class ProblemsController < ApplicationController
	before_filter :authenticate, :only => [:create, :destroy]
  	before_filter :authorized_user, :only => :destroy


  # GET /problems
  # GET /problems.xml
  def index
    @problems = Problem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @problems }
    end
  end

  # GET /problems/1
  # GET /problems/1.xml
  def show
    @problem = Problem.find(params[:id])
	@vote = Vote.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @problem }
    end
  end

  # GET /problems/new
  # GET /problems/new.xml
  def new
    @problem = Problem.new
    
    3.times do
      
      solution = @problem.solutions.build

    end
    
  end

  # GET /problems/1/edit
  def edit
    @problem = Problem.find(params[:id])
  end

  # POST /problems
  # POST /problems.xml
  def create
    @problem = current_user.problems.build(params[:problem])
    if @problem.save
          flash[:success] = "Problem created!"
          redirect_to @problem
    else
          render :action => 'new'
    end
   
  end

  # PUT /problems/1
  # PUT /problems/1.xml
  def update
    @problem = Problem.find(params[:id])

    respond_to do |format|
      if @problem.update_attributes(params[:problem])
        format.html { redirect_to(@problem, :notice => 'Problem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @problem.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @problem.destroy
    redirect_back_or root_path
  end

  private

    def authorized_user
      @problem = current_user.problems.find_by_id(params[:id])
      redirect_to root_path if @problem.nil?
    end

end
