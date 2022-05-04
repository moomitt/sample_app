class ListsController < ApplicationController
  def new
    @list = List.new    # Viewへ渡すインスタンス変数@list ← 空のModelオブジェクトList.newを生成
  end

  def create
    list = List.new(list_params)   # データを受け取り、新規登録するためのインスタンス作成
    list.save                      # データをデータベースに保存するためのsaveメソッド実行
    redirect_to '/top'             # トップ画面へリダイレクト
  end
    
  def index
    @lists = List.all      # インスタンス変数@lists ← listsテーブルに保存されている全レコードを取得
  end

  def show
  end

  def edit
  end
  
  private      # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
  
end
