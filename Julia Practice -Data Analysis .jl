# Import the libraries 
using Pkg
Pkg.add("PlotlyJS")
Pkg.add("CSV")

Pkg.add("DataFrames")

using PlotlyJS ,CSV,DataFrames


df=dataset(DataFrame,"gapminder")

dfcan=df[df.country.=="Canada",:]

using PlotlyJS
using IJulia
plot(dfcan,kind="scatter", mode="lines" ,x=:year ,y=:lifeexp,Layout(title="Life Expectency In Canada"))


function Calculate_NPV(cash_flows::Vector{Float64},Initialcost::Float64,Discount_rate::Float64,Years::Int64)
   NPV=-Initialcost
    for i =1:length(cash_flows)
       NPV+=cash_flows[i]/((1+Discount_rate)^i)
    end 
    if NPV<0
       d= "The Investment Should be rejected"
    else 
      d= "The Investment is Profitable" 
    end 
    return NPV ,d
end 

cash_f=[19500.6,25000.68,35000.97]
cost=150000000
r=0.12
year=3;

Calculate_NPV([19500000000.,250000000.,350000000000.],15000000000.56,0.1,3)

function NPV_(cash_flows::Vector{Float64},Initialcost::Float64,Discount_rate::Float64,Years::Int64)
    discounted_cashflows=[cash_flows[i]/((1+Discount_rate)^i) for i in 1:length(cash_flows)]
    NPV=-Initialcost+ sum(discounted_cashflows)
    if NPV<0
       d= "The Investment Should be rejected"
    else 
        d= "The Investment is Profitable" 
    end 
    return NPV ,d
end

NPV_([19500000000.,250000000.,350000000000.],15000000000.56,0.1,3)

NPV_([19500000000.1,250000000.2,350000000000.3],15000000000.56,0.1,3)

println(NPV_([19500000000.1,250000000.2,350000000000.3],15000000000.56,0.1,3))
println(Calculate_NPV([19500000000.1,250000000.2,350000000000.3],15000000000.56,0.1,3))


