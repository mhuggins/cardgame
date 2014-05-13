module ApplicationHelper

  def body_tag_params
    {
      :data => { :controller => controller_name, :action => action_name }
    }
  end

end
