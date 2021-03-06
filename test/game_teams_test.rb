require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_teams'

class GameTeamsTest < Minitest::Test
  def setup
    @game_teams_data = {
                      "game_id" => "2012030221",
                      "team_id" => "3",
                      "HoA" => "away",
                      "won" => "FALSE",
                      "settled_in" => "OT",
                      "head_coach" => "John Tortorella",
                      "goals" => "2",
                      "shots" => "35",
                      "hits" => "44",
                      "pim" => "8",
                      "powerPlayOpportunities" => "3",
                      "powerPlayGoals" => "0",
                      "faceOffWinPercentage" => "44.8",
                      "giveaways" => "17",
                      "takeaways" => "7"
                    }

    @game_teams = GameTeams.new(@game_teams_data)
  end

  def test_game_teams_class_exists
    assert_instance_of GameTeams, @game_teams
  end

  def test_game_teams_class_has_attributes
    assert_equal "2012030221", @game_teams.game_id
    assert_equal "3", @game_teams.team_id
    assert_equal "away", @game_teams.hoa
    assert_equal "false", @game_teams.won
    assert_equal "OT", @game_teams.settled_in
    assert_equal "John Tortorella", @game_teams.head_coach
    assert_equal 2, @game_teams.goals
    assert_equal 35, @game_teams.shots
    assert_equal 44, @game_teams.hits
    assert_equal 8, @game_teams.pim
    assert_equal 3, @game_teams.power_play_opportunities
    assert_equal 0, @game_teams.power_play_goals
    assert_equal 44.8, @game_teams.face_off_win_percentage
    assert_equal 17, @game_teams.giveaways
    assert_equal 7, @game_teams.takeaways
  end

end
