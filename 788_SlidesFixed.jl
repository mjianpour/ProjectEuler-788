### A Pluto.jl notebook ###
# v0.20.4

using Markdown
using InteractiveUtils

# ╔═╡ a263e12c-04b3-40bc-aa3d-1974fece2686
html"<button onclick='present()'>present</button>"

# ╔═╡ 6ac03810-4514-11f0-0406-8f4527600876
md"""
# Problem 788
"""

# ╔═╡ 526d36fa-bdee-41a0-9454-945b0027688a
md"""
# Defining the D(N) function
"""

# ╔═╡ 296e9894-d51f-4c8f-ac6e-f3f4ccb05254
MOD = 1_000_000_007

# ╔═╡ 7011da9e-64c2-42d9-973f-dc3f2c95e895
function D_0(n)
	half_count = Int(floor(n/2) + 1)

	desired_values = 0
	for i in half_count:n
		total = binomial(n, i) * 10 * 9 ^ n-i
		zero_rep = binomial(n-1, i-1) * 9 ^ n-i
		nine_rep = 0
		if i <= n-1
			nine_rep = binomial(n-1, i) * 9 * 9 ^ (n - i - 1)
		end
		desired_values += (total - zero_rep - nine_rep)
	end

	return desired_values
end

# ╔═╡ 53202810-7cba-4d62-8fdd-91db9b992cc2
md"""
# Since 2022 factorial is a huge number, we should use "BigInt()" function of Julia ...
"""

# ╔═╡ 83aea3cf-ad7d-48b8-9bf5-2133a18f351d
# D with BigInts ... 
function D(n)
	half_count = Int(floor(n/2) + 1)

	desired_values = 0
	for i in half_count:n
		total = binomial(BigInt(n), BigInt(i)) * 10 * 9 ^ BigInt(n-i)
		zero_rep = binomial(BigInt(n-1), BigInt(i-1)) * 9 ^ BigInt(n-i)
		nine_rep = 0
		if i <= n-1
			nine_rep = binomial(BigInt(n-1), BigInt(i)) * 9 * 9 ^ BigInt(n - i - 1)
		end
		desired_values += (total - zero_rep - nine_rep)
	end

	return desired_values
end

# ╔═╡ 8d1be2c6-acef-40e8-ba03-2f4206df1263
md"""
# Using D(N) function for integer Ns, from 1 to 2022, by using a loop
"""

# ╔═╡ bc439a03-d02d-4c4a-a702-4221ae448fa5
function compute(n)
	Ds = 0
	for i in 1:n
		Ds += D(i)
	end

	return Ds
end

# ╔═╡ faae0dc6-baa9-4ee9-983f-9b0429b72d27
md"""
# Testing D(N) for the examples given in question: 
"""

# ╔═╡ eb28d7c5-e3a4-4f22-8c71-7e2a7535cf5e
compute(10)

# ╔═╡ abf54cff-72a0-4266-8634-bd397f4a96b1
compute(4)

# ╔═╡ 2a2a0448-2bf1-4d26-9317-bd4a8b618eb9
md"""
# Calculating for "2022" MOD "1 000 000 007"
Note this might take 1-2 minutes processing!
"""

# ╔═╡ cbabc7d2-5fcf-4232-86d8-f0dcefe56fbc
println(compute(2022) % MOD)

# ╔═╡ d37ecb2e-cbe3-4833-8f53-0ce1140f5c90
md"""
# Correct answer provided by ProjectEuler
"""

# ╔═╡ e2fa26b2-718c-4e2a-9095-2329657c08ba
471745499

# ╔═╡ Cell order:
# ╟─a263e12c-04b3-40bc-aa3d-1974fece2686
# ╟─6ac03810-4514-11f0-0406-8f4527600876
# ╟─526d36fa-bdee-41a0-9454-945b0027688a
# ╠═296e9894-d51f-4c8f-ac6e-f3f4ccb05254
# ╠═7011da9e-64c2-42d9-973f-dc3f2c95e895
# ╟─53202810-7cba-4d62-8fdd-91db9b992cc2
# ╠═83aea3cf-ad7d-48b8-9bf5-2133a18f351d
# ╟─8d1be2c6-acef-40e8-ba03-2f4206df1263
# ╠═bc439a03-d02d-4c4a-a702-4221ae448fa5
# ╟─faae0dc6-baa9-4ee9-983f-9b0429b72d27
# ╠═eb28d7c5-e3a4-4f22-8c71-7e2a7535cf5e
# ╠═abf54cff-72a0-4266-8634-bd397f4a96b1
# ╟─2a2a0448-2bf1-4d26-9317-bd4a8b618eb9
# ╠═cbabc7d2-5fcf-4232-86d8-f0dcefe56fbc
# ╟─d37ecb2e-cbe3-4833-8f53-0ce1140f5c90
# ╠═e2fa26b2-718c-4e2a-9095-2329657c08ba
