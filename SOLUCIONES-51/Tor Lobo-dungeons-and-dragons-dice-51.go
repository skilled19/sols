package main

import (
    "fmt"
    "bufio"
    "os"
    "strconv"
    "strings"
    "math"
)

// must be in bufio.ScanLines mode for this to work
func ReadLineInts(scanner *bufio.Scanner) ([]int, error) {
    result := make([]int, 0, 0)
    var err error
    if scanner.Scan() {
        line := scanner.Text()
        words := strings.Fields(line)
        for _,s := range words {
            res, err := strconv.Atoi(s)
            if err != nil {
                return result, err
            }
            result = append(result, res)
        }
    } else {
        err = scanner.Err()
    }
    return result, err
}

type DieSet struct {
    number int
    sides int
}
func CreateDieSet(number, sides int) *DieSet {
    var set *DieSet = new(DieSet)
    set.number = number
    set.sides = sides
    return set
}
func (set *DieSet) Range() int {
    return set.Max() - set.Min()
}
func (set *DieSet) Min() int {
    return set.number
}
func (set *DieSet) Max() int {
    return set.sides * set.number
}
func (set *DieSet) Avg() float64 {
    return float64(set.number) * (float64(set.sides) + 1.0) / 2.0
}
func (set *DieSet) Fit(vals []int) float64 {
    sum := 0
    count := 0
    min := vals[0]
    max := vals[0]
    for _,v := range vals {
        if v == 0 {
            continue
        } else if v < set.Min() {
            return 0.0
        } else if v > set.Max() {
            return 0.0
        } else {
            if v < min {
                min = v
            }
            if v > max {
                max = v
            }
            sum += v
            count += 1
        }
    }
    avg := float64(sum) / float64(count)
    rangefit := float64(max - min)/ float64(set.Range())
    avgfit := 2.0 * math.Abs(avg - set.Avg()) / float64(set.Range())
    fit := 2.0 + rangefit - avgfit
    return fit
}
func (set *DieSet) String() string {
    return fmt.Sprintf("%dd%d",set.number, set.sides)
}

func main() {
    scnr := bufio.NewScanner(os.Stdin)
    scnr.Split(bufio.ScanLines)
    arr := make([]string, 0, 0)
    dies := make([]*DieSet, 0, 0)
    for sides := 2; sides <= 12; sides+=2 {
        for number:=1; number<6; number++ {
            var ds *DieSet = CreateDieSet(number, sides)
            dies = append(dies, ds)
        }
    }
    for i:=0; i<3; i++ {
        vals, _ := ReadLineInts(scnr)
        var bestfit float64 = 0.0
        var set *DieSet = nil
        for _, die := range dies {
            fit := die.Fit(vals)
            if fit > bestfit {
                set = die
                bestfit = fit
            }
        }
        arr = append(arr, set.String())
    }
    
    fmt.Println("Answer:")
    fmt.Println(arr)
    
}