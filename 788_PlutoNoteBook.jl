### A Pluto.jl notebook ###
# v0.20.4

using Markdown
using InteractiveUtils

# ╔═╡ 6ac03810-4514-11f0-0406-8f4527600876
# Problem 788

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

# ╔═╡ bc439a03-d02d-4c4a-a702-4221ae448fa5
function compute(n)
	Ds = 0
	for i in 1:n
		Ds += D(i)
	end

	return Ds
end

# ╔═╡ eb28d7c5-e3a4-4f22-8c71-7e2a7535cf5e
compute(10)

# ╔═╡ abf54cff-72a0-4266-8634-bd397f4a96b1
compute(4)

# ╔═╡ cbabc7d2-5fcf-4232-86d8-f0dcefe56fbc
println(compute(2022) % MOD)

# ╔═╡ e2fa26b2-718c-4e2a-9095-2329657c08ba
471745499

# ╔═╡ Cell order:
# ╠═6ac03810-4514-11f0-0406-8f4527600876
# ╠═296e9894-d51f-4c8f-ac6e-f3f4ccb05254
# ╠═7011da9e-64c2-42d9-973f-dc3f2c95e895
# ╠═83aea3cf-ad7d-48b8-9bf5-2133a18f351d
# ╠═bc439a03-d02d-4c4a-a702-4221ae448fa5
# ╠═eb28d7c5-e3a4-4f22-8c71-7e2a7535cf5e
# ╠═abf54cff-72a0-4266-8634-bd397f4a96b1
# ╠═cbabc7d2-5fcf-4232-86d8-f0dcefe56fbc
# ╠═e2fa26b2-718c-4e2a-9095-2329657c08ba
