def authenticated_user
  if @current_user
    @current_user.username
  else
    "System"
  end
end
Audited.current_user_method = :authenticated_user