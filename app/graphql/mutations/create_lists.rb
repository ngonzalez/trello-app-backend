module Mutations
  class CreateLists < Mutations::BaseMutation
    graphql_name "CreateLists"

    argument :item_id, String, required: true
    argument :lists, GraphQL::Types::JSON, required: true

    field :board, Types::Board, null: false

    def resolve(args)
      begin
        board = Board.find_by(item_id: args[:item_id])
        JSON.parse(args[:lists]).each do |list| 
          board.lists.create!(item_id: list['id'], name: list['name'])
        end

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
