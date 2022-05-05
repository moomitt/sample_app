class ListsController < ApplicationController
  def new
    @list = List.new    　　#インスタンス(空のModel)Listを作成、インスタンス変数@listに代入
    end

  def create
    list = List.new(list_params)     # インスタンス(モデル)をlist_paramsの内容で作成、ローカル変数listに代入　※Viewに渡さないので、ローカル変数
    list.save                        # ローカル変数listをデータベースに保存
    redirect_to list_path(list.id)   # list_path(=showアクション)へリダイレクト
  end
    
  def index
    @lists = List.all     　　　　　 # listsテーブル内の全レコードを取得、インスタンス変数@listsに代入
  end

  def show
    @list = List.find(params[:id])     # listsテーブル内の:id番目のレコードを取得、インスタンス変数@listsに代入
  end                                  # params[:id] ... urlからid番号(:id)を取得

  def edit
    @list = List.find(params[:id])     # listsテーブル内の:id番目のレコードを取得、インスタンス変数@listsに代入
  end                                  # params[:id] ... urlからid番号(:id)を取得
  
  def update
    list = List.find(params[:id])      # listsテーブル内のn番目のレコードを取得、ローカル変数listに代入　　※Viewに渡さないので、ローカル変数
    list.update(list_params)           # ローカル変数list(=listsテーブル内のn番目のレコード)を、list_paramsの内容で更新
    redirect_to list_path(list.id)     # list_path(=showアクション)へリダイレクト
  end
  
  private      　　　　　　　　　　　　# ストロングパラメータ：フォーム入力内容を安全に保存
  def list_params
    params.require(:list).permit(:title, :body)
  end
  
end
