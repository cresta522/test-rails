class UsersController < ApplicationController
  def show
    # routesで設定している [resource]でのパラメータはデフォルトで :id
    # 変えたければ resources :users, param: :date
    @user = User.find(params[:id])
  end
end
