class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end


  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end


  def edit
    @article = Article.find(params[:id])
  end


  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end



  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end


  def create
    @article = Article.new(article_params)
    @article.save
    if @article.save
    redirect_to @article
    else
    render 'new'
    end
  end

  before_action :tokenAuth
  def route
     @all = Article.all
     render :json => @all ,include: ['comments']
  end


  def tokenAuth
    hmac_secret = 'my$ecretK3y'
    begin
      decoded_token = JWT.decode params[:token], hmac_secret, true, { algorithm: 'HS256' }
    rescue
      render :json => { "Message ": "Authentication error" }
    end
    puts decoded_token
    return true      
  end 


  skip_before_action :verify_authenticity_token
  def token
    user = User.find_by_email(params[:email])
    if user 
      if user.valid_password?(params[:pass])  
        payload = { data: user.id }
         hmac_secret = 'my$ecretK3y'
         token = JWT.encode payload, hmac_secret, 'HS256'
         render :json => { auth_token: token }       
      else
          render :json => { "Message ": "Authentication error" }

      end
    else
        render :json => { "Message ": "Authentication error" }

    end

    # hmac_secret = 'my$ecretK3y'
    # token = JWT.encode payload, hmac_secret, 'HS256'
    # render :json => { auth_token: token }
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end


end
