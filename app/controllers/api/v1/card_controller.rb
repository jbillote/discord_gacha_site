class Api::V1::CardController < ApplicationController
  def show
    card = {
        set: params["set"].to_s,
        rarity: params["rarity"].to_s,
        id: params["id"].to_i,
    }

    items = DynamoDBClient.get_card(card)
    items = items[0]

    render :json => items["cards"][params["id"].to_i]
  end
end