module ApplicationHelper
  def show_edit_actions(object)
    true if @current_user.id = object.user.id
  end
end
