module Mutations
  class GetBoard < Mutations::BaseMutation
    graphql_name "GetBoard"

    argument :item_id, String, required: true

    field :board, Types::Board, null: false

    def resolve(args)
      begin
        board = Board.find_by(item_id: args[:item_id])

        MutationResult.call(
          obj: { board: board },
          success: board.present?,
          errors: board.errors,
        )
      rescue ActiveRecord::RecordInvalid => exception
        GraphQL::ExecutionError.new(exception.message)
      end
    end
  end
end
