package Day1

import (
  "fmt"
  "strconv"
  "github.com/zylphrex/aoc2020/src/util"
)

func Day1Part1(input string) (string, error) {
  xs, err := util.ParseInts(input)
  if err != nil {
    return "", err
  }

  a, b, err := solveDay1Part1(2020, xs)
  return strconv.Itoa(a * b), err
}

func solveDay1Part1(c int, xs []int) (int, int, error) {
  for i, a := range xs {
    for j := i + 1; j < len(xs); j++ {
      b := xs[j]
      if a + b == c {
        return a, b, nil
      }
    }
  }
  return 0, 0, fmt.Errorf("No solution found")
}
