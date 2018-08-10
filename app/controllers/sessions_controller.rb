class SessionsController < ApplicationController
  # POST /sessions
  # POST /sessions.json
  def create
    byebug
    @user = User.find_by_email(session_params[:email])

    respond_to do |format|
      if @user.validate session_params[:password]
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: "Successfully Logged in as #{@user.email}." }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Successfully logged out' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:email, :password)
    end
end






# render :new, formats: :json
# render 'new', formats: :html, layout: false
# render action: :new
# render 'users/new'
# render template: 'users/new'
# render 'full/path/rails_guides/app/views/users/new'
# render file: 'full/path/rails_guides/app/views/users/new', status: 303, location: 'http://www.chicagobears.com'
# redirect_to 'http://www.chicagobears.com', status: 303
