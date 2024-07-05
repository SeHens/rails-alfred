class SessionsController < Devise::SessionsController
  def destroy
    super do
      session.delete(:selected_filter)
      session[:selected_filter] = nil
    end
  end
end
