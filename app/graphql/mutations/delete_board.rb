module Mutations
  class DeleteBoard < Mutations::BaseMutation
    graphql_name "DeleteBoard"

    argument :item_id, String, required: true

    def resolve(args)
      begin
        board = Board.find_by(item_id: args[:item_id])
        board.destroy if board

        MutationResult.call(
          obj: { },
          success: board.persisted?,
          errors: board.errors,
        )
      rescue ActiveRecord::RecordInvalid => exception
        GraphQL::ExecutionError.new(exception.message)
      end
    end
  end
end
