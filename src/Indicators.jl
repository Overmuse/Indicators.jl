module Indicators

using DataStructures: CircularBuffer, isfull, capacity, length, popfirst!
using Statistics: mean
import Base: push!
import DataStructures: isfull, capacity
import Statistics: mean

export Return, MovingAverage, Crossover, value
abstract type Indicator end

include("returns.jl")
include("moving_average.jl")
include("crossover.jl")

end # module
