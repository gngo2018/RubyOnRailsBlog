class ArticlesController < ApplicationController
    # Article GET All
    def index
        @articles = Article.all
    end
    # Article GET by id
    def show
        @article = Article.find(params[:id])
      end

    def new
    end

    # Article Create POST
    def create
        @article = Article.new(article_params)
 
        @article.save
        redirect_to @article
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
