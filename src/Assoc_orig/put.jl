putAdj(A::Assoc,AA::AbstractSparseMatrix) =  Assoc(copy(A.row),copy(A.col),copy(A.val),AA)
putAdj(A::Assoc,AA::Array{Int,2}) =  putAdj(A::Assoc,sparse(AA))

StringOrNum = Union{AbstractString,Number}
UnionArray = Array{Union{AbstractString,Number}}

# put for new array
putRow(A::Assoc,ARow::UnionArray) =  Assoc(ARow,copy(A.col),copy(A.val),copy(A.A))
putCol(A::Assoc,ACol::UnionArray) =  Assoc(copy(A.row),ACol,copy(A.val),copy(A.A))
putVal(A::Assoc,AVal::UnionArray) =  Assoc(copy(A.row),copy(A.col),AVal,copy(A.A))

# put for new scalar
function putRow(A::Assoc,ARow::StringOrNum)
    r,c,v = find(A)
    Assoc(ARow,c,v)
end

function putCol(A::Assoc,ACol::StringOrNum)
    r,c,v = find(A)
    Assoc(r,ACol,v)
end

function putVal(A::Assoc,AVal::StringOrNum)
    r,c,v = find(A)
    Assoc(r,c,AVal)
end
