# Instructions

Continuing your work with the amusement park, you are tasked with writing some utility methods to facilitate checking an attendee can use a ride.

## 1. Check if an attendee has a ride pass

Implement the `Attendee#has_pass?` method to return a boolean (`true`/`false`) value based on the presence of a ride pass.

```ruby
Attendee.new(100).has_pass?
# => false
```

## 2. Check if an attendee fits a ride

Implement the `Attendee#fits_ride?` method to see if an attendee fits a ride based on their height.

```ruby
Attendee.new(140).fits_ride?(100)
# => true
```

## 3. Check if an attendee is allowed to ride

Implement the `Attendee#allowed_to_ride?` method to see if an attendee is allowed to go on a ride. The ride's required minimum height is provided as an argument. An attendee must have a ride pass and be able to fit the ride.

```ruby
attendee = Attendee.new(100)
attendee.issue_pass!(42)
attendee.allowed_to_ride(120)
# => false
```
