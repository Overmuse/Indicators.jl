struct Crossover <: Indicator
    ma1::MovingAverage
    ma2::MovingAverage
end
function Base.show(io::IO, c::Crossover)
    print(io, "Moving Average Crossover ($(capacity(c.ma1)) - $(capacity(c.ma2))): $(value(c))")
end
isfull(c::Crossover) = isfull(c.ma1) && isfull(c.ma2)
function push!(c::Crossover, x)
    push!(c.ma1, x)
    push!(c.ma2, x)
    c
end

value(c) = isfull(c) ? value(c.ma1) - value(c.ma2) : NaN
