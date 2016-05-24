class ArticlesController < ApplicationController
    
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article Successfully Created"
            redirect_to articles_path
        else
            render 'new'
        end
    end
    
    def new
        @article = Article.new
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.new(article_params)
        if @article.update
            flash[:notice] = "Article Successfully Updated"
            redirect_to articles_path
        else
            render 'edit'
        end
    end
    
    private
        def article_params
            params.require(:article).permit(:title, :description)
        end
    
end