local op=assert(io.open("op.txt", "w"));

local n=io.read("*n", 1);
for i=1, n do
    local a, b=io.read("n", "n");
    local r=1;
    for j=1, b do
        r=(r+a/r)/2;
    end
    op:write(r, " ");
end
