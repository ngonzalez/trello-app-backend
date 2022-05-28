module Mutations
  class CreateBoard < Mutations::BaseMutation
    graphql_name "CreateBoard"

    argument :name, String, required: true
    argument :item_id, String, required: true
    argument :url, String, required: true
    argument :short_url, String, required: true

    field :board, Types::Board, null: false

    def resolve(args)
      begin
        board = Board.create!(name: args[:name], item_id: args[:item_id], url: args[:url], short_url: args[:short_url])

        MutationResult.call(
          obj: { board: board },
          success: board.persisted?,
          errors: board.errors,
        )
      rescue ActiveRecord::RecordInvalid => exception
        GraphQL::ExecutionError.new(exception.message)
      end
    end
  end
end
