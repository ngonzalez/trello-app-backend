module Mutations
  class ListBoards < Mutations::BaseMutation
    graphql_name "ListBoards"

    argument :page, Integer, required: true

    field :results, [Types::Board], null: false
    field :current_page, Integer, null: false
    field :total_pages, Integer, null: false

    def resolve(args)
      boards = Board.order("created_at::timestamp DESC")

      paginated_results = Kaminari.paginate_array(boards).page(args[:page]).per(5)

      MutationResultPaginated.call(
        obj: {
          results: paginated_results,
        },
        success: true,
        errors: [],
        current_page: paginated_results.current_page,
        total_pages: paginated_results.total_pages,
      )
    end
  end
end
