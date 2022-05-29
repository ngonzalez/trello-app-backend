module Mutations
  class GetList < Mutations::BaseMutation
    graphql_name "GetBoard"

    argument :item_id, String, required: true
    argument :list_id, String, required: true

    field :list, Types::List, null: false

    def resolve(args)
      board = Board.find_by(item_id: args[:item_id])
      list = board.lists.detect { |list| list.item_id == args[:list_id] }

      MutationResult.call(
        obj: { list: list },
        success: list.present?,
        errors: [],
      )
    end
  end
end
