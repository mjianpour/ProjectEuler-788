MOD = 1_000_000_007

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

	return desired_values - 1
end

function compute(n)
	Ds = 0
	for i in 1:n
		Ds += D(i)
	end

	return Ds + n
end

compute(10)

println(compute(2022) % MOD)