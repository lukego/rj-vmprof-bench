vmprofile = require("jit.vmprofile")

vmprofile.start() -- start sampling

benchmarks =
   {"md5", "array3d", "coroutine-ring", "series", "meteor", "euler14-bit"}

for _, benchmark in ipairs(benchmarks) do
   -- Create a private vmprofile 
   vmprofile.select(vmprofile.open(benchmark..".vmprofile"))
   -- Run the benchmark
   dofile("bench/"..benchmark..".lua")
end

