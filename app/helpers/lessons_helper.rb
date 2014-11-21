module LessonsHelper

  # one line methods also return that line
  def on_your_lessons_page?
    action_name == 'your_lessons'
  end

  def display_solved(lesson)
    (lesson.solved) ? ' - COMPLETED' : ''
  end

end
