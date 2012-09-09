module ApplicationHelper

  def body_classes
    [controller.controller_name, controller.action_name].join(" ")
  end

end
