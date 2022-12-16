# Instructions

Your friend Linus is a Locomotive Engineer who drives cargo trains between cities.
Although they are amazing at handling trains, they are not amazing at handling logistics or computers.
They would like to enlist your programming help organizing train details and correcting mistakes in route data.

```exercism/note
This exercise could easily be solved using slicing, indexing, and various `hash` methods.
However, we would like you to practice packing, unpacking, and multiple assignment in solving each of the tasks below.
```

## 1. Create an list of all wagons

Your friend has been keeping track of each wagon identifier (ID), but they are never sure how many wagons the system is going to have to process at any given time. It would be much easier for the rest of the logistics program to have this data packaged into a unified **array**.

Implement a method `generate_list_of_wagons()` that accepts an arbitrary number of wagon IDs.
Each ID will be a positive integer.
The method should then `return` the given IDs as a single **array**.

```ruby
LocomotiveEngineer.generate_list_of_wagons(1, 7, 12, 3, 14, 8, 5)
# => [1, 7, 12, 3, 14, 8, 5]
```

## 2. Fix the list of wagons

At this point, you are starting to get a feel for the data and how it's used in the logistics program.
The ID system always assigns the locomotive an ID of **1**, with the remainder of the wagons in the train assigned a randomly chosen ID greater than **1**.

Your friend had to connect two new wagons to the train and forgot to update the system!
Now, the first two wagons in the train **array** have to be moved to the end, or everything will be out of order.

To make matters more complicated, your friend just uncovered a second **array** that appears to contain missing wagon IDs.
All they can remember is that once the new wagons are moved, the IDs from this second **array** should be placed directly after the designated locomotive.

Linus would be really grateful to you for fixing their mistakes and consolidating the data.

Implement a method `fix_list_of_wagons()` that takes two **arrays** containing wagon IDs.
It should reposition the first two items of the first **array** to the end, and insert the values from the second **array** behind (_on the right hand side of_) the locomotive ID (**1**).
The method should then `return` a **array** with the modifications.

```ruby
LocomotiveEngineer.fix_list_of_wagons([2, 5, 1, 7, 4, 12, 6, 3, 13], [3, 17, 6, 15])
# => [1, 3, 17, 6, 15, 7, 4, 12, 6, 3, 13, 2, 5]
```

## 3. Add missing stops

Now that all the wagon data is correct, Linus would like you to update the system's routing information.
Along a transport route, a train might make stops at a few different stations to pick up and/or drop off cargo.
Each journey could have a different amount of these intermediary delivery points.
Your friend would like you to update the systems routing **hash** with any missing/additional delivery information.

Implement a method `add_missing_stops()` that accepts a routing **hash** followed by a variable number of keyword arguments.
These arguments could be in the form of a **hash** holding one or more stops, or any number of `stop_<number>: "city"` keyword pairs.
Your method should then return the routing **hash** updated with an additional **key** that holds a **array** of all the added stops in order.

```ruby
LocomotiveEngineer.add_missing_stops({from: "New York", to: "Miami"},
                    stop_1: "Washington, DC", stop_2: "Charlotte", stop_3: "Atlanta",
                    stop_4: "Jacksonville", stop_5: "Orlando")
# => {from: "New York", to: "Miami", stops: ["Washington, DC", "Charlotte", "Atlanta", "Jacksonville", "Orlando"]}
```

## 4. Extend routing information

Linus has been working on the routing program and has noticed that certain routes are missing some important details.
Initial route information has been constructed as a **hash** and your friend would like you to update that **hash** with whatever might be missing.
Every route in the system requires slightly different details, so Linus would really prefer a generic solution.

Implement a method called `extend_route_information()` that accepts two **hashes**.
The first **hash** contains the origin and destination cities the train route runs between.

The second **hash** contains other routing details such as train speed, length, or temperature.
The method should return a consolidated **hash** with all routing information.

```exercism/note
The second **hash** can contain different/more properties than the ones shown in the example.
```

```ruby
LocomotiveEngineer.extend_route_information({"from": "Berlin", "to": "Hamburg"}, {"length": "100", "speed": "50"})
# => {"from": "Berlin", "to": "Hamburg", "length": "100", "speed": "50"}
```
