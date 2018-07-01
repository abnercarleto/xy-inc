class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from StandardError, with: :error

  private

  def error
    render json: { status: 422, message: 'Unprocessable entity' }, status: :unprocessable_entity
  end

  def record_not_found
    render json: { status: 404, message: 'Not Found' }, status: :not_found
  end

  def render_object(object)
    if object.errors.present?
      render json: object.errors, status: :unprocessable_entity
    else
      status = (object.created_at == object.updated_at) ? :created : :ok
      render json: object, status: status
    end
  end
end
