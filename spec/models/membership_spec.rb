# == Schema Information
#
# Table name: memberships
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  role        :string(255)      default("member")
#

require 'spec_helper'

describe Membership do
  pending "add some examples to (or delete) #{__FILE__}"
end
