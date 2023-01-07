# https://www.youtube.com/watch?v=cWNEl4HE2OE&t=515s
# Assuming that the flights are 2-way. Given all available routes, a src and a dst city, find the connecting flights needed to fly to that dst city. 

require 'set'

ROUTES =
  [["PHX", "LAX"],
   ["PHX", "JFK"],
   ["JFK", "OKC"],
   ["JFK", "HEL"],
   ["JFK", "LOS"],
   ["MEX", "LAX"],
   ["MEX", "BKK"],
   ["MEX", "LIM"],
   ["MEX", "EZE"],
   ["LIM", "BKK"]]

AIRPORTS = "PHX BKK OKC JFK LAX MEX EZE HEL LOS LAP LIM"

def flights(src, dst)
  hash = build_hash(ROUTES)
#   pp hash

  # dfs
  dfs_traversal(hash, "PHX", "BKK")

  # bfs
  bfs_traversal(hash, "PHX", "BKK")
end

def bfs_traversal(hash, start_city, dest_city)
    queue = [start_city]
    visited_cities  = Set.new

    counter = 0
    

    while !queue.empty?
        airport =  queue.pop

        destinations = hash[airport]

        visited_cities << airport

        for destination in destinations
            if destination == dest_city
                puts("BFS found #{dest_city} in #{counter} steps")
                counter = 0
            end

            unless visited_cities.include?(destination)     
                visited_cities << destination
                queue.push(destination)
                counter = counter + 1
                p destination
            end
        end
    end
end

def dfs_traversal(hash, start_city, dest_city, visited_cities = [])
  puts(start_city)

  if hash[start_city].include?(dest_city)
    puts("DFS found #{dest_city} in #{visited_cities.size() + 1} steps")
    return start_city
  end

  visited_cities << start_city

  for destination in hash[start_city]
    dfs_traversal(hash, destination, dest_city, visited_cities) unless visited_cities.include?(destination)
  end
end

def build_hash(routes)
  hash = {}
  for element in routes
    key = element[0]
    value = element[1]

    (hash[key] ||= []) << value
    (hash[value] ||= []) << key
  end

  hash
end

flights("PHX", "LOS")
