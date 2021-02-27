class PostsController < ApplicationController
  #ルーティングでposts#indexを定義しているので、postsコントローラーってのを作りましたということですね
  def index #indexという名前のインスタンスメソッドを定義しただけです
    @posts = Post.all.order(id: "DESC") #これをpostsディレクトリのindex.html.erbっていう対応したビューで使えるようになりますって話です
    #orderメソッドを使ってレコードの順番を並び替えてる。DESC（降順）。ちなみにデフォルトはASC（昇順）
  end

  def create
    Post.create(content: params[:content])
    #これはPostモデルにActiveRecordメソッドのcreateを適用して、その後(カラム名:paramsの中身取り出したいのでparams[:content])と記載してますよ〜
    redirect_to action: :index
    #クリエイトできたらindexページにリダイレクトしてくださいねの記述
  end

  def checked
    post = Post.find(params[:id]) #既読にしたメモのidから、該当のレコードを取得
    if post.checked #選択されたレコードがもしも既に既読状態だったら？という分岐。updateというのはアクティブレコードメソッド。
      post.update(checked: false) #既に既読であった場合の処理。checked:fakseに変更するので、要するに既読外すってこと
    else
      post.update(checked: true) #もし未読だったら、既読に変更してねの記述
    end

    item = Post.find(params[:id]) #上の分岐で更新したレコードを取得し直してる。多分jsに渡すために
    render json: { post: item } #わかりづらいんだけど、「今ほど定義したitemというレコードですが、jsに渡すデータはjsonの形式でくださいね」の記述
  end

end
