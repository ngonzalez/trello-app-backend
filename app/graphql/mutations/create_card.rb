module Mutations
  class CreateCard < Mutations::BaseMutation
    graphql_name "CreateCard"

    argument :name, String, required: true
    argument :item_id, String, required: true
    argument :list_id, String, required: true
    argument :desc, String, required: true
    argument :start, String, required: true
    argument :due, String, required: true

    field :card, Types::Card, null: false

    def resolve(args)
      list = List.find_by(item_id: args[:list_id])
      card = list.cards.new(
        name: args[:name],
        item_id: args[:item_id],
        desc: args[:desc],
        start: args[:start],
        due: args[:due],
        pos: 'bottom',
        due_complete: false,
      )

      MutationResult.call(
        obj: { card: card },
        success: card.persisted?,
        errors: card.errors,
      )
    end
  end
end
