class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.where.not(id: current_user.id).page(params[:page])
  end

  # POST /users/1/act_as
  def act_as
    change_to_id = params[:id]
    admin_id = current_user.id.to_s
    session[:act_as] = {'user' => change_to_id, 'admin' => admin_id}
    sign_in_as_user change_to_id
    redirect_to :root, notice: 'Identity changed!'
  end

  # DELETE /users/myself_again
  def myself_again
    sign_in_as_user session[:act_as]['admin']
    session.delete(:act_as)
    redirect_to :root, notice: 'Yourself again'
  end

  private
  def sign_in_as_user(user_id)
    sign_user = User.find(user_id)
    sign_in(:user, sign_user, {bypass: true})
  end
end
