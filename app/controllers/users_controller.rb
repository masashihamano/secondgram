class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # paramsのセキュリティ:ストロングパラメーター使い、正常な情報のみ受け取る設定する → privateメソッドを追加する
    # @user = User.new(name: params[:user][:name], email: params[:user][:email])↓に書き換える
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: '登録が完了しました'
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
