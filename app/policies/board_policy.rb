class BoardPolicy
  def self.is_request_authorized?(action_name, board, user)
    is_user_account_authorized?(board, user) && is_user_action_authorized?(action_name, user)
  end

  def self.is_user_account_authorized?(board, user)
    user.account.id == board.account.id
  end

  def self.is_user_action_authorized?(action_name, user)
    case action_name
    when "show"
      user.role == "user" || user.role == "admin" || user.role == "owner"
    when "update"
      user.role == "admin" || user.role == "owner"
    when "destroy"
      user.role == "admin" || user.role == "owner"
    else
      "Error, invalid action"
    end
  end
end
