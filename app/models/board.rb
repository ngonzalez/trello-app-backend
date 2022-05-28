# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  name       :string           not null
#  short_url  :string           not null
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :string           not null
#
# Indexes
#
#  index_boards_on_item_id  (item_id)
#
class Board < ActiveRecord::Base
  has_many :lists, class_name: "List", dependent: :destroy, foreign_key: :board_id

  has_paper_trail

  acts_as_paranoid
end
