# Write your code here!

require 'pry'

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
        ]
    }
  }
end

def num_points_scored(name)
  hash = game_hash
  i = 0
  while i < hash[:home][:players].length
    if name == hash[:home][:players][i][:player_name]
      points = hash[:home][:players][i][:points]
    elsif name == hash[:away][:players][i][:player_name]
      points = hash[:away][:players][i][:points]
    end
    i += 1
  end
  points
end

def shoe_size(name)
  hash = game_hash
  i = 0
  while i < hash[:home][:players].length
    if name == hash[:home][:players][i][:player_name]
      return hash[:home][:players][i][:shoe]
    elsif name == hash[:away][:players][i][:player_name]
      return hash[:away][:players][i][:shoe]
    end
    i += 1
  end
end

def team_colors(name)
  hash = game_hash
  i = 0
  while i < hash.length
    if name == hash[:home][:team_name]
      color = hash[:home][:colors]
    elsif name == hash[:away][:team_name]
      color = hash[:away][:colors]
    end
  i += 1  
  end
  color
end

def team_names
  array = []
  game_hash.each do |place, team|
    array << team[:team_name]
  end
  array
end

def player_numbers(team_name)
  nums = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player|
            nums << player[:number]
          end
        end
      end 
    end 
  end
  nums
end

def player_stats(name)
  new_hash = {}
  game_hash.each do |home_away, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name] == name
            new_hash = player.delete_if do |k, v|
              k == :player_name
            end
          end
        end
      end
    end
  end
  new_hash
end


def big_shoe_rebounds
  hash = game_hash
  big_shoe = 0
  big_rebounds = 0
  i = 0
  while i < hash[:home][:players].length
    if big_shoe < hash[:home][:players][i][:shoe]
      big_shoe = hash[:home][:players][i][:shoe]
      big_rebounds = hash[:home][:players][i][:rebounds]
    elsif big_shoe < hash[:away][:players][i][:shoe]
      big_shoe = hash[:away][:players][i][:shoe]
      big_rebounds = hash[:away][:players][i][:rebounds]
    end
  i += 1
  end
return big_rebounds
end

def most_points_scored
  hash = game_hash
  points = 0
  name = 0
  i = 0
  while i < hash[:home][:players].length
    if points < hash[:home][:players][i][:points]
      points = hash[:home][:players][i][:points]
      name = hash[:home][:players][i][:player_name]
    elsif big_shoe < hash[:home][:players][i][:points]
      points = hash[:home][:players][i][:points]
      name = hash[:home][:players][i][:player_name]
    end
  i += 1
  end
return name
end





