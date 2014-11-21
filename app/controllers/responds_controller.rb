class RespondsController < ApplicationController

  before_filter :auth, only: [:create]
  #saving to two tables associated with each other
  def create
    @lesson = Lesson.find(params[:lesson_id])
    @respond = @lesson.responds.build(params[:respond])
    @respond.user = current_user

    if @respond.save
      flash[:success] = 'You AAR respond has been posted'
      redirect_to @lesson
    else
      @lesson = Lesson.find(params[:lesson_id])
      render 'lessons/show'
    end
  end
end
