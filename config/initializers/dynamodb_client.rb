module DynamoDBClient
  def self.init
    @client ||= Aws::DynamoDB::Client.new(
        access_key_id: "AKIAJOWNVUODCXVVZT3Q",
        secret_access_key: "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",
        region: "us-west-1"
    )
  end

  def self.get_user_info(user)
    resp = @client.query({
      expression_attribute_values: {
          ":v" => user.to_s
      },
      key_condition_expression: "user_id = :v",
      table_name: "discord_waifus_users",
    })

    return resp.items
  end

  def self.get_card(card)
    resp = @client.query({
      expression_attribute_values: {
          ":v" => card[:rarity].to_s.upcase,
      },
      key_condition_expression: "rarity = :v",
      table_name: card[:set].to_s,
    })

    return resp.items
  end
end