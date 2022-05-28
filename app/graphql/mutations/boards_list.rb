module Mutations
  class BoardsList < Mutations::BaseMutation
    graphql_name "BoardsList"

    argument :page, Integer, required: true

    field :results, [Types::Board], null: false
    field :current_page, Integer, null: false
    field :total_pages, Integer, null: false

    def resolve(args)
      boards = Board.order("created_at::timestamp DESC")

      paginated_results = Kaminari.paginate_array(boards).page(args[:page]).per(15)

      MutationResultPaginated.call(
        obj: {
          results: paginated_results,
        },
        loading: false,
        errors: [],
        current_page: paginated_results.current_page,
        total_pages: paginated_results.total_pages,
      )
    end
  end
end
