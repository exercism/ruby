# Instructions

In this exercise you will build out rules for a movie theater's website.

## 1. Check if a moviegoer is entitled to the seniors' discount

The theatre offers a discount for "old-age-pensions".
Anyone who is 60 or older pays 10.00 for a ticket.
Anyone younger pays the full 15.00.

Write the `Moviegoer#ticket_price` method using a ternary statement.

```ruby
Moviegoer.new(21).ticket_price
#=> 15

Moviegoer.new(65).ticket_price
#=> 10
```

## 2. Check if a moviegoer is allowed to see scary movies

The cinema has a simplified age-verification system.
If you are 18 or over you can watch scary movies.
If you are younger, you cannot.

Implement the `Moviegoer.watch_scary_movie?` method.
It should return whether someone is allowed to watch the movie or not.

```ruby
Moviegoer.new(21).watch_scary_movie?
#=> true

Moviegoer.new(17).watch_scary_movie?
#=> false
```

## 3. Check if a moviegoer is entitled to free popcorn

The cinema has a Movie Club program.
Members get free popcorn when they watch any movie.

Implement the `Moviegoer.claim_free_popcorn!` method.
If a viewer is a movie club member, they should be rewarded with their free popcorn.
If they are not, the method should raise the `NotMovieClubMemberError` exception defined at the top of the code.


```ruby
Moviegoer.new(21, member: true).claim_free_popcorn!
#=> 🍿

Moviegoer.new(17, member: false).claim_free_popcorn!
#=> Exception was raised! (NotMovieClubMemberError)
```
