class ApplicationController < ActionController::API
  def render_object(object)
    if object.errors.present?
      render json: object.errors, status: :unprocessable_entity
    else
      status = (object.created_at == object.updated_at) ? :created : :ok
      render json: object, status: status
    end
  end
end
