class UsersController < ApplicationController
  layout 'application2'
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
        # render options
      # :content_type
      # :layout
      # :location
      # :status
      # :formats
    @users = User.all
    # redirect_to (new_force_user_path )
    # redirect_to (force_user_path ForceUser.first)
    # render plain: "What is going on here"
    # render inline: "What is going on here #{Jedi.pluck(:name).join(", ")}?"
    # render 'new'
    # render file: '/Users/joe/Dropbox/coding/coding/ruby/rails/wip/rails5/sith_lineage/app/views/force_users/index.html.slim', layout: false
    # render template: 'force_users/index.json.jbuilder'
    # render json: @force_users
    # render js: "document.write(\"from\") "
    # render  location: 'http://www.chicagobears.com', status: 303,
    # redirect_to new_force_user_path, status: :forbidden
    # render 'index', formats: [:json, :html]
    render json: @force_users
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.js   { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    byebug
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:age, :authorized, :birthday, :email, :password, :password_confirmation, :sexuality)
    end
end
