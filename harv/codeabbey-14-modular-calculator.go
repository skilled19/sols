package main

import (
    "bufio"
    "fmt"
    "math/big"
    "os"
    "strings"
)

type modularCalculator struct {
    num *big.Int
}

func (m *modularCalculator) cal(operator string, that *big.Int) {
    if m.num.Int64() == 0 {
        return
    }

    switch operator {
    case "+":
        m.num = m.num.Add(m.num, that)
    case "*":
        m.num = m.num.Mul(m.num, that)
    case "%":
        m.num = m.num.Mod(m.num, that)
    }
}

func (m modularCalculator) result() string {
    return m.num.String()
}

//https://www.codeabbey.com/index/task_view/modular-calculator
func main() {
    if len(os.Args) == 1 {
        return
    }

    //input
    scanner := bufio.NewScanner(os.Stdin)
    m := new(modularCalculator)

    m.num = new(big.Int)
    m.num.SetString(os.Args[1], 10)

    for scanner.Scan() {
        s := strings.Split(scanner.Text(), " ")
        operator := s[0]
        that := new(big.Int)
        that.SetString(s[1], 10)

        m.cal(operator, that)
        if operator == "%" {
            break
        }
    }
    fmt.Println(m.result())
}
// sangazh

