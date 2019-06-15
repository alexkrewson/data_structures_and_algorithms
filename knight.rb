

class Campsite
    attr_accessor :coordinates, :coordinates_list, :up_left, :up_right, :left_up, :left_down, :down_left, :down_right, :right_up, :right_down, :route, :routes, :routes_before_finding
  
    def initialize(coordinates,coordinates_list,depth)
      if coordinates
        @old_depth = {}
        @coordinates = coordinates
        @depth = depth
        @depth += 1
        @coordinates_list = coordinates_list
        @coordinates_list[@coordinates] = @depth
        puts ""
  
        @up_left =    Campsite.new(move_up_left(   @coordinates),@coordinates_list,@depth) if move_up_left(   @coordinates) && depth_comparison(move_up_left(@coordinates),@coordinates_list,@depth)   
  
        @up_right =   Campsite.new(move_up_right(  @coordinates),@coordinates_list,@depth) if move_up_right(  @coordinates) && depth_comparison(move_up_left(@coordinates),@coordinates_list,@depth)  
  
        @left_up =   Campsite.new(move_left_up(  @coordinates),@coordinates_list,@depth) if move_left_up(  @coordinates) && depth_comparison(move_left_up(@coordinates),@coordinates_list,@depth)  
  
        @left_down =   Campsite.new(move_left_down(  @coordinates),@coordinates_list,@depth) if move_left_down(  @coordinates) && depth_comparison(move_left_down(@coordinates),@coordinates_list,@depth)  
  
        @down_left =   Campsite.new(move_down_left(  @coordinates),@coordinates_list,@depth) if move_down_left(  @coordinates) && depth_comparison(move_down_left(@coordinates),@coordinates_list,@depth)   
  
        @down_right =   Campsite.new(move_up_right(  @coordinates),@coordinates_list,@depth) if move_up_right(  @coordinates) && depth_comparison(move_up_left(@coordinates),@coordinates_list,@depth)  
  
        @right_up =   Campsite.new(move_right_up(  @coordinates),@coordinates_list,@depth) if move_right_up(  @coordinates) && depth_comparison(move_right_up(@coordinates),@coordinates_list,@depth)  
  
        @right_down =   Campsite.new(move_right_down(  @coordinates),@coordinates_list,@depth) if move_right_down(  @coordinates) && depth_comparison(move_right_down(@coordinates),@coordinates_list,@depth)  
  
  
        @routes = []
        @origin = self
        @last_place_before_destination = []
      end
    end
  
    def move_up_left(coordinates)
      destination = [coordinates[0] - 2, coordinates[1] - 1]
      valid_move(destination)
    end
  
    def move_up_right(coordinates)
      destination = [coordinates[0] - 2, coordinates[1] + 1]
      valid_move(destination)
    end
  
    def move_left_up(coordinates)
      destination = [coordinates[0] - 1, coordinates[1] - 2]
      valid_move(destination)
    end
  
    def move_left_down(coordinates)
      destination = [coordinates[0] + 1, coordinates[1] - 2]
      valid_move(destination)
    end
  
    def move_down_left(coordinates)
      destination = [coordinates[0] + 2, coordinates[1] - 1]
      valid_move(destination)
    end
  
    def move_down_right(coordinates)
      destination = [coordinates[0] + 2, coordinates[1] + 1]
      valid_move(destination)
    end
  
    def move_right_up(coordinates)
      destination = [coordinates[0] - 1, coordinates[1] + 2]
      valid_move(destination)
    end
  
    def move_right_down(coordinates)
      destination = [coordinates[0] + 1, coordinates[1] + 2]
      valid_move(destination)
    end
  
    def valid_move(destination)
      return destination unless destination[0] < 0 || destination[0] > 7 || destination[1] < 0 || destination[1] > 7
    end
  
    def depth_comparison(coordinates,coordinates_list,depth)
      @depth = depth
  
      if coordinates_list[(coordinates)] && @depth
        if coordinates_list[(coordinates)] >= @depth
          return true
        else
          return false
        end
  
      end
      return true
  
  
    end
  
  
  
  
  
    def travel_to(origin,destination,route,routes)
  
        @current_campsite = self
        @origin = origin
        @destination = destination
        @route = route
        @routes = routes
        puts "@current_campsite.coordinates: #{@current_campsite.coordinates}"
        if @current_campsite.coordinates
          @route.push(@current_campsite.coordinates)
        end
  
        puts "@route after arrival push: #{@route}"
        puts ""
  
        if @current_campsite.coordinates == destination # if at destination
  
          @routes.push(@route)
          puts "@routes: #{@routes}"
          @new_route = @route[0..-2]
          puts "found"
          return @new_route
        end
  
        if @current_campsite.up_left # if not at destination, search up left
  
          puts "searching up left:"
          @route = @current_campsite.up_left.travel_to(@origin,destination,@route,@routes)
          puts "done searching up left"
          puts "@route: #{@route}"
          # return nil
        end
  
        if @current_campsite.up_right            # if destination not found up left, search up right
  
          puts "searching up right:"
          @route = @current_campsite.up_right.travel_to(@origin,destination,@route,@routes)
          puts "done searching up right"
          puts "@route: #{@route}"
          # return nil
        end
  
        if @current_campsite.left_up            # if destination not found up left, search up right
  
          puts "searching left up:"
          @route = @current_campsite.left_up.travel_to(@origin,destination,@route,@routes)
          puts "done searching left up"
          puts "@route: #{@route}"
          # return nil
        end
  
        if @current_campsite.left_down            # if destination not found up left, search up right
  
          puts "searching left down:"
          @route = @current_campsite.left_down.travel_to(@origin,destination,@route,@routes)
          puts "done searching left down"
          puts "@route: #{@route}"
          # return nil
        end
  
        if @current_campsite.down_left            # if destination not found up left, search up right
  
          puts "searching left down:"
          @route = @current_campsite.down_left.travel_to(@origin,destination,@route,@routes)
          puts "done searching left down"
          puts "@route: #{@route}"
          # return nil
        end
  
        if @current_campsite.down_right            # if destination not found up left, search up right
  
          puts "searching down right:"
          @route = @current_campsite.down_right.travel_to(@origin,destination,@route,@routes)
          puts "done searching down right"
          puts "@route: #{@route}"
          # return nil
        end
  
        if @current_campsite.right_up            # if destination not found up left, search up right
  
          puts "searching down right:"
          @route = @current_campsite.right_up.travel_to(@origin,destination,@route,@routes)
          puts "done searching down right"
          puts "@route: #{@route}"
          # return nil
        end
  
        if @current_campsite.right_down            # if destination not found up left, search up right
  
          puts "searching down right:"
          @route = @current_campsite.right_down.travel_to(@origin,destination,@route,@routes)
          puts "done searching down right"
          puts "@route: #{@route}"
          # return nil
        end
  
        if @route
          @new_route = @route[0..-2]
        end
        return @new_route
    end# travel to
  end # class Campsite
  
  
  
  
  
  
  
  campsite = Campsite.new([7,2],{},0)
  
  
  puts ""
  puts "destination [7,0] found at campsite:   #{campsite.travel_to([7,2],[1,5],[],[])}"
  
  shortest_route = campsite.routes[0]
  c = 0
  while c < campsite.routes.length
    if campsite.routes[c].length < shortest_route.length
      shortest_route = campsite.routes[c]
    end
    c += 1
  end
  
  puts "a shortest route: #{shortest_route}"
  
  
  
  
  
  