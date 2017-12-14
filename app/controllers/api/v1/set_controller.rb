class Api::V1::SetController < ApplicationController
  def show
    items = DynamoDBClient.get_set(params["set"].to_s)

    render :json => items[0]
  end
end