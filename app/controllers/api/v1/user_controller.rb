class Api::V1::UserController < ApplicationController
  def show
    items = DynamoDBClient.get_user_info(params["id"])
    items = items[0]

    cards = []
    items["cards"].each do |card|
      cards << {
          quantity: card["quantity"].to_i,
          set: card["set"].to_s,
          id: card["id"].to_i,
          rarity: card["rarity"].to_s,
      }
    end

    resp = {
        user_id: items["user_id"].to_s,
        last_pack_opened: items["last_pack_opened"].to_s,
        cards: cards,
    }

    render :json => resp
  end
end