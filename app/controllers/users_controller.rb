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
end
