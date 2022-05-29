# == Schema Information
#
# Table name: lists
#
#  id         :bigint           not null, primary key
#  closed     :boolean
#  deleted_at :datetime
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer          not null
#  item_id    :string           not null
#
# Indexes
#
#  index_lists_on_item_id  (item_id)
#
class List < ActiveRecord::Base
  belongs_to :board, class_name: "Board", foreign_key: :board_id

  has_many :cards, class_name: "Card", dependent: :destroy, foreign_key: :list_id

  has_paper_trail

  acts_as_paranoid
end
