class Admin::GenresController < ApplicationController
  def index
    @genre=Genre.new
    @genres = Genre.all

  end

  def create
    # 新規登録ボタンが押されたら、データを変数に格納
    genre = Genre.new(genre_params)
    # セーブする
    genre.save
    # 処理後のpathを指定
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    # 入力された値を受け取る変数
    genre = Genre.find(params[:id])
    # アップデート
    genre.update(genre_params)
    # アップデート後の遷移先を指定
    redirect_to admin_genres_path
    # redirect_to admin_genre_path
  end


  private

  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end


end
