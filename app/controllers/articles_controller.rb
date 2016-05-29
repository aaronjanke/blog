class ArticlesController < ApplicationController

    def new
        @article = Article.new
    end
    
    def show
       @article = Article.find(params[:id]) 
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article Saved Successfully!"
            redirect_to articles_path
        else
            render 'new'
        end
    end
    
    
    
    def index
        @articles = Article.all

    end 
    
    
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article Updated"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :description)
    end
    




end