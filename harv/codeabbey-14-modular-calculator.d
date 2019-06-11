import std.stdio;


void main()
{
    uint number; readf("%d\n", &number);
    uint[][] operations;
    
    bool running = true;
    while (running) {
        char operator;
        uint member;
        readf("%c %d\n", &operator, &member);
        
        operations ~= [operator, member];
        
        if (operator == '%') running = false;
    }
    
    uint moduloMember = operations[$ - 1][1];
    
    foreach (operation; operations) {
        auto operator = cast(char) operation[0]; 
        uint member = operation[1];
        
        final switch (operator)
        {
            case '+':
                number += member;
                break;
                
            case '*':
                number *= member;
                break;
                
            case '%':
                number %= member;
                break;
        }
        
        number %= moduloMember;
    }
    
    writeln(number);
}

# yozhikv10