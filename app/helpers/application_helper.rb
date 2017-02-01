module ApplicationHelper
  def controller?(controller)
    controller.include?(params[:controller])
  end

  def action?(action)
    action.include?(params[:action])
  end

  def active?(controller, action)
    controller?(controller) && action?(action) ? 'active' : ''
  end

end
