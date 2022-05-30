module Mutations
  class GetBoard < Mutations::BaseMutation
    graphql_name "GetBoard"

    argument :item_id, String, required: true

    field :board, Types::Board, null: false
    field :lists, [Types::List], null: false
    field :cards, [Types::Card], null: false

    def resolve(args)
      board = Board.find_by(item_id: args[:item_id])
      cards = board.lists.flat_map(&:cards).uniq

      MutationResult.call(
        obj: { board: board, lists: board.lists, cards: cards },
        success: board.present?,
        errors: board.errors,
      )
    end
  end
end
