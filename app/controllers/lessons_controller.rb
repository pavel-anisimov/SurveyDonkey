class LessonsController < ApplicationController
  before_filter :auth, only: [:create, :your_lessons, :edit, :update]

  def index
    @lesson = Lesson.new
    @lessons = Lesson.unsolved(params)
    @solved = Lesson.solved(params)
  end

  def create
    @lesson = current_user.lessons.build(params[:lesson])
    if @lesson.save
      flash[:success] = 'Class/lesson has been created'
      redirect_to @lesson
    else
      @lessons = Lesson.unsolved(params)
      render 'index'
    end
  end

  def show
    # having access to both tables
    @lesson = Lesson.find(params[:id])
    @respond = Respond.new # creating a new question
  end

  def your_lessons
    @lessons = current_user.your_lessons(params)
  end

  def edit
    @lesson = current_user.lessons.find(params[:id])
  end

  def update
    @lesson = current_user.lessons.find(params[:id])

    if @lesson.update_attributes(params[:lesson])
      flash[:success] = 'Your lesson has been updates'
      redirect_to @lesson
    else
      render 'edit'
    end
  end

  def search
    @lessons = Lesson.search(params)
  end
end
