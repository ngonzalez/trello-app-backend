module Types
  class MutationType < Types::BaseObject
    field :create_board, mutation: Mutations::CreateBoard
    field :list_boards, mutation: Mutations::ListBoards
  end
end
