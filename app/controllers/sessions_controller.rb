class SessionsController < ApplicationController
  def new
  end

  def create
    # ↓入力されたemailの情報を取得し、一致するユーザーがいるか検索
    user = User.find_by(email: params[:session][:email])
    # ↓userのパスワードが正しいかどうか確認
    if user && user.authenticate(params[:session][:password])
      # ↓「userが存在している。かつ、userのパスワードが正しければ。」
      log_in user
      redirect_to root_path, notice: 'ログインに成功しました'
    else
      # ↓どちらかでも正しくなければ
      flash.now[:alert] = "ログインに失敗しました"
      render 'new'
    end
  end


  # def destroy
  #   log_out
  #   redirect_to root_url
  # end


  private
  # ↓log_inメソッド内でログイン情報を保存
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
  #↓session.deleteはRailsに事前定義されているメソッド、sessionを削除する
    session.delete(:user_id)
    @current_user = nil
  end
end
