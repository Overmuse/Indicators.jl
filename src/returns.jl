struct Return <: Indicator
    buffer::CircularBuffer{Float64}
    Return() = new(CircularBuffer{Float64}(2))
end
function Base.show(io::IO, r::Return)
    print(io, "Return: $(value(r))")
end

value(r::Return) = isfull(r) ? r.buffer[2] / r.buffer[1] - 1 : NaN
function push!(r::Return, x)
    push!(r.buffer, x)
    return r
end
isfull(r::Return) = isfull(r.buffer)
