
n = 2 .^ [6 6 7 8 9 10 11 12 13 14 15 16 17 18]

K = 8

MaxGB = 2
MaxGF = 4 * 1.6

m = K .* n
assoc_gbytes = zeros(1,length(n))
assoc_flops = zeros(1,length(n))
assoc_gflops = zeros(1,length(n))
assoc_time = zeros(1,length(n))
assoc_string_gbytes = zeros(1,length(n))
assoc_string_flops = zeros(1,length(n))
assoc_string_gflops = zeros(1,length(n))
assoc_string_time = zeros(1,length(n))

# Integer Labels
println("With Integer Labels")
for i = 1:length(n)

    global assoc_gflops, assoc_time, assoc_gbytes, assoc_flops
    
    ii = round.(Int, floor.(rand(m[i]) .* n[i]) .+ 1)
    jj = round.(Int, floor.(rand(m[i]) .* n[i]) .+ 1)
    A = Assoc(ii,jj,1.0)

    ii = round.(Int, floor.(rand(m[i]) .* n[i]) .+ 1) 
    jj = round.(Int, floor.(rand(m[i]) .* n[i]) .+ 1) 
    B = Assoc(ii,jj,1.0)

    assoc_time[i] = @elapsed C = A*B
    assoc_flops[i] = 2*sum(C)
    ii, jj, vv = find(C)
    assoc_gbytes[i] = assoc_gbytes[i] + (length(ii) + length(jj)) + 8 .* m[i] ./ 1e9
    assoc_gflops[i] = assoc_flops[i] ./ assoc_time[i] ./ 1e9
    print("Time: ", assoc_time[i])
    print(", GFlops: ", assoc_gflops[i])
    println(", GBytes: ", assoc_gbytes[i])
end


# String Labels
println("With String Labels")
for i = 1:length(n)

    global assoc_string_gflops, assoc_string_time, assoc_string_gbytes, assoc_string_flops
    
    ii = join(string.(rand(1:n[i],m[i])),",")*","
    jj = join(string.(rand(1:n[i],m[i])),",")*","
    A = Assoc(ii,jj,1.0)

    ii = join(string.(rand(1:n[i],m[i])),",")*","
    jj = join(string.(rand(1:n[i],m[i])),",")*","
    B = Assoc(ii,jj,1.0)

    assoc_string_time[i] = @elapsed C = A*B
    
    assoc_string_flops[i] = 2*sum(C)
    ii, jj, vv = find(C)
    assoc_string_gbytes[i] = assoc_string_gbytes[i] + (length(ii) + length(jj)) + 8 .* m[i] ./ 1e9
    assoc_string_gflops[i] = assoc_string_flops[i] ./ assoc_string_time[i] ./ 1e9
    print("Time: ", assoc_string_time[i])
    print(", GFlops: ", assoc_string_gflops[i])
    println(", GBytes: ", assoc_string_gbytes[i])
end
