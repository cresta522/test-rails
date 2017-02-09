class UsersController < ApplicationController
  before_action :authenticate_user!, :except=>[:show]

  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    # routesで設定している [resource]でのパラメータはデフォルトで :id
    # 変えたければ resources :users, param: :date
    @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  
  private
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
