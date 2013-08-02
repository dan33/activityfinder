# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  address     :string(255)
#  longitude   :float
#  latitude    :float
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Activity do
  pending "add some examples to (or delete) #{__FILE__}"
end
