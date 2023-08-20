# Instructions

The port of Palermo is a busy harbor, with a lot of ships coming and going.
It has for a long time had a manual system for keeping track of the ships that are currently in the harbor.
This system is very error prone, and the harbor chief has decided to replace it with a computerized system.

The harbor chief has hired you to implement the new system.
The system has to handle identifiers for ships, but also for destinations.

## 1. Create the ports identifier

The first thing you need to do is to create the identifier for the port of Palermo.
The identifier are the first four letters of the name of the port, in uppercase.

Define the `Port::IDENTIFIER` constant to be a symbol with the value `:PALE`.
    
```ruby
Port::IDENTIFIER 
# => :PALE
```

## 2. Get identifiers for other ports

The program will also have to handle other ports, so you need to create identifiers for them as well.
The port would like the system to be automated and since ports uses different naming conventions, the identifiers should be generated from the name of the port.
The identifier are the first four letters of the name of the port, in uppercase.

Define the `Port.get_identifier` method to take a string as an argument, and returns the identifier as a symbol for that port.

```ruby
Port.get_identifier("Hamburg") 
# => :HAMB
```

## 3. Determine which terminal a ship should dock at

The port has two terminals, and the system needs to determine which terminal a ship should dock at.
The terminal is determined by the identifier of the ship.

The identifier is built of 2 parts, the first part is made of 3 uppercased letters which says which cargo the ship is carrying, and then 3 numbers which is the unique identifier of the ship.

If the identifier of the ship is carrying: **OIL** or **GAS** the ship should dock at terminal **A**.
Else the ship should dock at terminal **B**. 

Define the `Port.get_terminal` method to take a symbol as an argument which is the identifier of the ship.
The method should return the terminal as a symbol.

```ruby
Port.get_terminal(:OIL123)
# => :A
```
