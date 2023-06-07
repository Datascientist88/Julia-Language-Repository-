function Calculate_NPV(Initial_cost::Float64,Years::Int64,Cashflows::Vector{Float64},Discount_rate::Float64)
    NPV=-Initial_cost
    for i =1:length(Cashflows)
      NPV +=Cashflows[i]/(1+Discount_rate)^i
    end 
return NPV
end 

Calculate_NPV(120000.65,3,[85000.45,95000.65,78000])
