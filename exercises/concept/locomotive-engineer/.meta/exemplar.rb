class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons)
    wagons
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    first, second, locomotive, *other_wagons_ids = each_wagons_id
    [locomotive, *missing_wagons, *other_wagons_ids, first, second]
  end

  def self.add_missing_stops(route, **stops)
    {**route, stops: stops.values}
  end

  def self.extend_route_information(route, more_route_information)
    {**route, **more_route_information}
  end
end
