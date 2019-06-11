local op=assert(io.open("op.txt", "w"));

local n=io.read("*n", 1);
local inp, i={}, 1;
while true do
    inp[i]={};
    inp[i][1], inp[i][2]=io.read(1, "*n", 1);
    if inp[i][1] == '%' then break; end
    i=i+1;
end
for _, v in ipairs(inp) do
    if v[1]=='+' then n=(n+v[2])%inp[i][2];
    elseif v[1]=='*' then n=(n*v[2])%inp[i][2];
    else n=n%v[2]; end
end
op:write(n);
; tinbtinb