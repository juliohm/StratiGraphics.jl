# ------------------------------------------------------------------
# Licensed under the MIT License. See LICENCE in the project root.
# ------------------------------------------------------------------

"""
    GeoStatsProcess(solver)

Geostatistical process with simulation `solver`.
"""
struct GeoStatsProcess{S} <: TimelessProcess
  solver::S
end

function evolve!(land::Matrix, proc::GeoStatsProcess)
  domain   = CartesianGrid(size(land))
  problem  = SimulationProblem(domain, :land => Float64, 1)
  solution = solve(problem, proc.solver)
  land[:] .= solution[:land][1]
  nothing
end
