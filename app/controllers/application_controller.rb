class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def write_out_log
    return unless request.content_type.eql?('application/json')

    logger.debug {response.body}
  end
end
