require 'pry'
module TeamStatistics

  ########### James Iteration 4 Team Statistics #################
  def biggest_team_blowout(team_id)
    @games.map do |game|
      if game.away_team_id == team_id
        game.away_goals - game.home_goals
      elsif game.home_team_id == team_id
        game.home_goals - game.away_goals
      end
    end.compact.max
  end

  def worst_loss(team_id)
    @games.map do |game|
      if game.away_team_id == team_id
        game.away_goals - game.home_goals
      elsif game.home_team_id == team_id
        game.home_goals - game.away_goals
      end
    end.compact.min.abs
  end

  def head_to_head(team_id)
    subject_team_games = @games.group_by do |game|
      game.home_team_id == team_id || game.away_team_id == team_id
    end[true]

    subject_team_opponent_array = subject_team_games.map do |game|
      if team_id == game.home_team_id
        game.away_team_id
      else
        game.home_team_id
      end
    end

    teams_and_record = {}
    subject_team_opponent_array.uniq.each do |opponent|
      wins = 0
      losses = 0
      subject_team_games.each do |game|
        if opponent == game.home_team_id
          if game.home_goals > game.away_goals
            losses += 1
          else
            wins += 1
          end
        elsif opponent == game.away_team_id
          if game.away_goals > game.home_goals
            losses += 1
          else
            wins += 1
          end
        end
      end
      record = (wins.to_f / (wins + losses)).round(2)
      teams_and_record[return_team_name(opponent)] = record
    end
    teams_and_record
  end

  def seasonal_summary
    # For each season that the team has played, a hash that has two keys (:regular_season and :postseason), that each point to a hash with the following keys: :win_percentage, :total_goals_scored, :total_goals_against, :average_goals_scored, :average_goals_against.	Hash
  end
    ########### James Iteration 4 Team Statistics #################

end
