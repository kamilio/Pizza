class UsersController < ApplicationController
  load_and_authorize_resource
  
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
     @user = User.find(params[:id])
    respond_to do |format|
      format.html 
      format.json { render :json => @user }
    end
  end

  # Register user
  def create
    @user = User.new(params[:user])
    @user.roles << "registered"

    respond_to do |format|
      if @user.save
        format.html { redirect_to edit_user_path(@user), :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Save adddress
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to edit_user_path(@user), :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
