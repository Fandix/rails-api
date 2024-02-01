class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destoryed
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
    private
    def not_destoryed(e)
        render json: { error: "Delete record fail.", massage: e.record.errors }, status: :unprocessable_entity
    end

    def record_not_found
        render json: { error: "Record Not Found.", massage: e.record.errors }, status: :unprocessable_entity
    end
end
