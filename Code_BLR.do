clear 
cd E:\Pooh\Stata\BestIM\Ia 
import excel SWdata.xlsx,firstrow

gen logIa=log10(Ia)
gen logS1=log10(abs(S))
gen logW=log10(W)
gen logT=log10(T15)
gen logF=log10(100-F15)
gen logD=log10(D5015+0.1)
gen logDh=log10(Dh001)


regress logDh logIa logW logT logF logD


//BLR
set seed 20
bayes, gibbs: regress logDh logIa logS1 logW logT logF logD

