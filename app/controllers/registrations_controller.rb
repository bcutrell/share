class CustomFailure < Devise::FailureApp
  def redirect_url
    login_path
  end

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      flash[:notice] = I18n.t(:unauthenticated, :scope => [ :devise, :failure ])
      redirect_to root_path
    end
  end
end