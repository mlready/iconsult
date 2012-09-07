module SessionsHelper
  def sign_in(consultant)
    cookies.permanent[:remember_token] = consultant.remember_token
    self.current_consultant = consultant
  end
  
  def current_consultant=(consultant)
    @current_consultant = consultant
  end
  
  def current_consultant
    @current_consultant ||= Consultant.find_by_remember_token(cookies[:remember_token])
  end
  
  def signed_in?
    !current_consultant.nil?
  end
  
  def sign_out
    self.current_consultant = nil
    cookies.delete(:remember_token)
  end
end
