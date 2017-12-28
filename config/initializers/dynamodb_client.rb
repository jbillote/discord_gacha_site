module DynamoDBClient
  def self.init
    @client ||= Aws::DynamoDB::Client.new(
        access_key_id: ENV["AWS_ACCESS_KEY"],
        secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
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

  def self.search_for_users(username)
    resp = @client.scan({
      expression_attribute_values: {
          ":v" => username.to_s.downcase
      },
      filter_expression: "contains(username_searchable, :v)",
      projection_expression: "user_id, username",
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

  def self.get_set(set)
    resp = @client.query({
      expression_attribute_values: {
          ":v" => set.to_s,
      },
      key_condition_expression: "table_name = :v",
      table_name: "discord_waifus_sets",
    })

    return resp.items
  end
end