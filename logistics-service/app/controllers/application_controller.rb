# @restful_api 1.0
#
# Status of the Service
#
class ApplicationController < ActionController::API

  # @url /status
  # @action GET
  #
  # Gives the status of the service whether running or not
  #
  # @response [Json] containing the service name
  #
  # @example_request_description
  # @example_request
  # ```json
  # {
  #
  # }
  #
  # @example_response_description the response json will contain service name
  # @example_response
  #   ```json
  #   {
  #     service: 'logistics-service'
  #   }
  #   ```
  def status
    render json: {service: 'logistics-service'}, status: :ok
  end

end
