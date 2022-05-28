module Types
  class Board < Types::BaseObject
    graphql_name "Board"

    implements GraphQL::Types::Relay::Node
    global_id_field :id

    field :name, String, null: false
    field :item_id, String, null: false
    field :url, String, null: false
    field :short_url, String, null: false
  end
end
