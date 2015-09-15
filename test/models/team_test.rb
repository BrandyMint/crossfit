require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test 'при создании команды владелец добавляется в участники' do
    team = create :team

    assert_instance_of team, Team
    assert team.members.first, team.owner
  end
end
