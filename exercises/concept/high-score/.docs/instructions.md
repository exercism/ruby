# Instructions

In this exercise, you're implementing a way to keep track of the high scores for the most popular game in your local arcade hall.

## 1. Define a new high score map

To make a new high score map, define the `HighScore#initialize` function which doesn't take any arguments and initializes the new Scoreboard object instance. It should take an optional argument, with the default value of an empty hash.

```ruby
HighScore.new
```

## 2. Add players to the high score map

To add a player to the high score map, define `HighScore.add_player/3`, which is a function which takes 3 arguments:

- The first argument is the name of a player as a string.
- The second argument is the score as an integer. The argument is optional, implement the second argument with a default value of 0.

Store the default initial score in a module attribute. It will be needed again.

```ruby
score_map = HighScore.new()
score_map.add_player("Dave Thomas")
score_map.add_player("José Valim", 486_373)
```

## 3. Remove players from the score map

To remove a player from the high score map, define `HighScore#remove_player`, which takes 1 arguments:

- The first argument is the name of the player as a string.

```ruby
score_map = HighScore.new()
score_map.add_player("Dave Thomas")
score_map.remove_player("Dave Thomas")
```

## 4. Reset a player's score

To reset a player's score, define `HighScore#reset_score`, which takes 1 argument:

- The first argument is the name of the player as a string, whose score you wish to reset.

The score should be reset to the **initial score**, which in step 2, was defined to be **0**. You could refactor the initial score to a class constant, to be easily reused.

```ruby
score_map = HighScore.new
score_map.add_player("José Valim", 486_373)
score_map.reset_player_score("José Valim")
```

## 5. Update a player's score

To update a players score by adding to the previous score, define `HighScore#update_player_score`, which takes 2 arguments:

- The first argument is the name of the player as a string, whose score you wish to update.
- The second argument is the score that you wish to **add** to the stored high score.

```ruby
score_map = HighScore.new
score_map.add_player("José Valim", 486_373)
score_map.update_player_score("José Valim", 5)
```

## 6. Get a player's score

To get a player's score, define `HighScore#player_score` which takes one argument:

- The first argument is the name of the player, whose score should be returned.

```ruby
score_map = HighScore.new
score_map.add_player("Dave Thomas", 2_374)
score_map.add_player("José Valim", 486_373)
score_map.get_players
# => ["Dave Thomas", "José Valim"]
```

## 7. Get a list of players

To get a list of players, define `HighScore#players`.

```ruby
score_map = HighScore.new
score_map.add_player("Dave Thomas", 2_374)
score_map.add_player("José Valim", 486_373)
score_map.get_players
# => ["Dave Thomas", "José Valim"]
```
