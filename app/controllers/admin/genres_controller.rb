class Admin::GenresController < ApplicationController
  def index
    @genre=Genre.new
    @genres = Genre.all

  end

  def create
    # 新規登録ボタンが押されたら、データを変数に格納
    # genre = Genre.new(genre_params)
    # # セーブする
    # genre.save!
    # # 処理後のpathを指定
    # redirect_to admin_genres_path

    genre = Genre.new(genre_params)
    genre.save!
    # リダイレクト (一応：一覧画面へ)
    redirect_to admin_genres_path
  end

  def edit

  end

  def update

  end


  private

  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end


end
