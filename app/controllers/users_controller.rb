class UsersController < ApplicationController
  # rescue_from User::NotAuthorized, with: :user_not_authorized
  # force_ssl

  layout 'application'
  # before_action -> { redirect_to(new_user_path) unless logged_in? }, except: [:new, :create, :index]
  before_action :set_user, only: [:show, :update, :destroy, :edit]

  # GET /users
  # GET /users.json
  def index
        # render options
      # :content_type
      # :layout
      # :location
      # :status
      # :formats
    @users = User.order(name: :asc)
    byebug
    # redirect_to (new_force_user_path )
    # redirect_to (force_user_path ForceUser.first)
    # render plain: "What is going on here"
    # render inline: "What is going on here #{User.pluck(:name).join(", ")}?"
    # render 'new'
    # render file: '/Users/joe/Dropbox/coding/coding/ruby/rails/wip/rails5/sith_lineage/app/views/force_users/index.html.slim', layout: false
    # render template: 'force_users/index.json.jbuilder'
    # render json: @users
    # render js: "document.write(\"from\") "
    # render  location: 'http://www.chicagobears.com', status: 303
    # redirect_to new_force_user_path, status: :forbidden
    # redirect_to @user, notice: 'User was successfully created.'
    # render 'index', formats: [:json, :html]
    # render json: @users and return
    # head 302, location: 'http://www.chicagobears.com'
    # head 418 and return
    @user = User.first
    render 'mess_around_template'
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
    byebug

    # @user = User.includes(:dogs).find_by(user: user_params[:id])
    @all_dogs = Dog.order(:owner_id, :name)
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
      # params_dog_ids = params[:user]['dog_ids'][1..-1].map(&:to_i)
      # set_user.dog_ids_to_associate_with_user(params_dog_ids) unless params_dog_ids.blank?
      # Rails.logger.info "What are you the way you are?"

      # @user.reload.avatar.attach user_params[:avatar]

      respond_to do |format|
        if @user.reload.update(user_params)
          format.html { redirect_to @user, alert: 'User was successfully updated.' }
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

  def error
    raise User::NotAuthorized
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user ||= User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:avatar, :authorized, :birthday, :email, :name, :password, :password_confirmation, :sexuality, dog_ids: [])
    end

    def user_not_authorized
      flash[:alert] = 'User is not allowed to access this section'
      redirect_to users_path
    end
    # permitted scalar values =>  String, Symbol, NilClass, Numeric, TrueClass, FalseClass, Date, Time, DateTime, StringIO, IO, ActionDispatch::Http::UploadedFile, and Rack::Test::UploadedFile.
end



