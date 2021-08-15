class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit]
  
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new      #Prototypeモデルの新規オブジェクトを生成
  end

  def create
    @user = User.find(current_user.id)
    prototype_name_add = prototype_params
    prototype_name_add["name"] = @user.name
    @prototype = Prototype.create(prototype_name_add)
    if @prototype.save
       redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(prototype_params)
    if @prototype.save
      redirect_to  prototype_path(@prototype) #詳細ページへ
    else
      render :edit
    end
    


  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private #以下の記述はすべてプライベートメソッド
  def prototype_params
    params.require(:prototype).permit(:title,:catch_copy,:concept,:image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end