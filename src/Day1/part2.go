package Day1

import (
  "fmt"
  "strconv"
  "github.com/zylphrex/aoc2020/src/util"
)

func Day1Part2(input string) (string, error) {
  xs, err := util.ParseInts(input)
  if err != nil {
    return "", err
  }

  a, b, c, err := solveDay1Part2(2020, xs)
  return strconv.Itoa(a * b * c), err
}

func solveDay1Part2(t int, xs []int) (int, int, int, error) {
  for i, a := range xs {
    for j := i + 1; j < len(xs); j++ {
      b := xs[j]
      for k := j + 1; k < len(xs); k++ {
        c := xs[k]
        if a + b + c == t {
          return a, b, c, nil
        }
      }
    }
  }
  return 0, 0, 0, fmt.Errorf("No solution found")
}
