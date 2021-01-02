
mutable struct MovingAverage <: Indicator
    buffer::CircularBuffer{Float64}
    average::Float64
    MovingAverage(n) = new(CircularBuffer{Float64}(n), NaN)
end
function Base.show(io::IO, m::MovingAverage)
    print(io, "Moving Average ($(capacity(m))): $(value(m))")
end

value(m::MovingAverage) = m.average
capacity(m::MovingAverage) = capacity(m.buffer)
Base.length(m::MovingAverage) = length(m.buffer)
#push!(m::MovingAverage, x) = push!(m.buffer, x)
isfull(m::MovingAverage) = isfull(m.buffer)

function push!(m::MovingAverage, x)
    num_empty = capacity(m) - length(m)
    if num_empty > 1
        push!(m.buffer, x)
    elseif num_empty == 1
        push!(m.buffer, x)
        m.average = mean(m.buffer)
    else
        n = capacity(m)
        old = popfirst!(m.buffer)
        push!(m.buffer, x)
        m.average = (m.average * n + (x - old)) / n
    end
    m
end
