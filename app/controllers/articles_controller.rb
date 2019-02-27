class ArticlesController < ApplicationController
    # Article GET All
    def index
        @articles = Article.all
    end
    # Article Create POST
    def create
        @article = Article.new(article_params)
       
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    def new
        @article = Article.new
    end
    # Article GET by id
    def show
        @article = Article.find(params[:id])
      end
    # Article GET article to update 
    def edit
        @article = Article.find(params[:id])
    end
    # Article PUT
    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end
    # Article Delete
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
    
        redirect_to articles_path
    end


    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
