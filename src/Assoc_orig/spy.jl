import PyPlot.spy,PyPlot.xticks,PyPlot.yticks
function spy(A::Assoc)
   im = spy(Adj(logical(A)) );
   X = Col(A);
   Y = Row(A);

   numIdx = 8
   
   if length(X) > numIdx
       xIdx = 0:convert(Int64,floor((length(X)-1)/numIdx)):length(X)-1
   else
       xIdx = 0:(length(X)-1)
   end
   if length(Y) > numIdx
       yIdx = 0:convert(Int64,floor((length(Y)-1)/numIdx)):length(Y)-1
   else
       yIdx = 0:(length(Y)-1)
   end
   xticks(xIdx, X[xIdx+1],rotation="vertical")
   yticks(yIdx, Y[yIdx+1])
   
   return im

end
