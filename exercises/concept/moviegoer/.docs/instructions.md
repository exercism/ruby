In this exercise you will rewrite `if/else` statements from a movie theater's website into ternary conditionals.

## 1. Check if a moviegoer is entitled to the seniors' discount

Rewrite the `Moviegoer#ticket_price` method to utilize the ternary operator.

```ruby
  def ticket_price
    if age < 60
      15
    else
      10
    end
  end
```

## 2. Check if a moviegoer is allowed to see scary movies

```ruby
  def watch_scary_movie
    if age >= 18
      "Enjoy the movie!"
    else
      "You must be over 18 to see this movie."
    end
  end
```

## 3. Check if a moviegoer is entitled to free popcorn

```ruby
  def claim_free_popcorn
    if movie_club_member
      "Enjoy your free popcorn!"
    else
      "Join the Movie Club to get free popcorn."
    end
  end
```
