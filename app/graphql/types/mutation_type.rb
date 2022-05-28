module Types
  class MutationType < Types::BaseObject
    field :create_board, mutation: Mutations::CreateBoard
  end
end
