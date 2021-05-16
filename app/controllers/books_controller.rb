class BooksController < ApplicationController
    # notice we've defined a method called index for a BooksController instance. We tie this together with routes
  def index
    @books = Book.paginate(page: params[:page], per_page: 10)
  end

  def show
    @book = Book.find(params[:id])
    @comments = @book.comments.paginate(page: params[:page], per_page: 10).order('created_at ASC')
  end

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new book_params
    if @book.save
      flash[:notice] = "#{@book.title} saved."
      redirect_to @book
    else
      render :new
    end
  end
  
  def edit
    @book = Book.find params[:id]
  end
  
  def update
    @book = Book.find params[:id]
    if @book.update_attributes(book_params)
      flash[:notice] = "#{@book.title} saved."
      redirect_to @book
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find params[:id]
    book.destroy
    flash[:notice] = "#{book.title} deleted."
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :thoughts)
  end
end
