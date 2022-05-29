module Mutations
  class GetBoard < Mutations::BaseMutation
    graphql_name "GetBoard"

    argument :item_id, String, required: true

    field :board, Types::Board, null: false
    field :lists, [Types::List], null: false

    def resolve(args)
      board = Board.find_by(item_id: args[:item_id])

      MutationResult.call(
        obj: { board: board, lists: board.lists },
        success: board.present?,
        errors: board.errors,
      )
    end
  end
end
