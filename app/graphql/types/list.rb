module Types
  class List < Types::BaseObject
    graphql_name "List"

    implements GraphQL::Types::Relay::Node
    global_id_field :id

    field :name, String, null: false
    field :item_id, String, null: false
  end
end
