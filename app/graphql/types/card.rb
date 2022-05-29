module Types
  class Card < Types::BaseObject
    graphql_name "Card"

    implements GraphQL::Types::Relay::Node
    global_id_field :id

    field :name, String, null: false
    field :item_id, String, null: false
    field :list_id, String, null: false
    field :desc, String, null: false
    field :due, String, null: false
    field :start, String, null: false
  end
end
