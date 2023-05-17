class Doctors::SessionsController < Devise::SessionsController
  respond_to :json
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  private

  def respond_with(_resource, _opts = {})
    render json: { message: 'Signed in successfully' }, status: :ok
  end

  def respond_to_on_destroy
    current_doctor ? log_out_success : log_out_failure
  end

  def log_out_success
    render json: { message: 'Signed out.', flash:, session: }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Sign out failure.', flash:, session:  }, status: :unauthorized
  end
end
