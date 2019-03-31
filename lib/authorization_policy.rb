module AuthorizationPolicy
  def is_request_authorized? action_name, resource, current_user
    "#{resource.class}Policy".constantize.is_request_authorized? action_name, resource, current_user
  end
end
