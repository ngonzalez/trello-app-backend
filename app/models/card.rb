# == Schema Information
#
# Table name: cards
#
#  id           :bigint           not null, primary key
#  deleted_at   :datetime
#  desc         :string           not null
#  due          :datetime         not null
#  due_complete :boolean          not null
#  name         :string           not null
#  pos          :integer          not null
#  start        :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  item_id      :string           not null
#  list_id      :integer          not null
#
# Indexes
#
#  index_cards_on_item_id  (item_id)
#
class Card < ActiveRecord::Base
  belongs_to :list, class_name: "List", foreign_key: :list_id

  has_paper_trail

  acts_as_paranoid
end
