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

end
