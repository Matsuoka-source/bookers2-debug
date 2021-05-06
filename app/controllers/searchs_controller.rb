class SearchsController < ApplicationController
  def  search# viewのform_tagにて,
    @model = params["model"]#選択したmodelの値を@modelに代入。
    @content = params["content"]# 検索ワードを@contentに代入
    @method = params["method"]# 選択した検索方法の値を@methodに代入。
    @records = search_for(@model, @content, @method)# @model, @content, @methodを代入した、search_forを@recordsに代入。
  end

  private
  def  search_for(model, content, method)
    if model == 'user'#選択したモデルがuserだったら
      if method == 'perfect'#選択した検索方法が完全一致なら
        User.where(name: content)
      else
        User.where('name LIKE ?', '%'+content+'%')#選択した検索方法が部分一致なら
      end
    elsif model =='book'#選択したモデルがbookだったら
      if method == 'perfect'#完全一致
        Book.where(title: content)
      else
        Book.where('title LIKE ?', '%'+content+'%')
      end
    end
  end

end
