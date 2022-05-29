module Types
  class MutationType < Types::BaseObject
    field :create_board, mutation: Mutations::CreateBoard
    field :list_boards, mutation: Mutations::ListBoards
    field :delete_board, mutation: Mutations::DeleteBoard
    field :get_board, mutation: Mutations::GetBoard
    field :create_lists, mutation: Mutations::CreateLists
  end
end
