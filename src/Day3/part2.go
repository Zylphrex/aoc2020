package Day3

import (
  "strconv"
  "strings"
)

func Day3Part2(input string) (string, error) {
  lines := strings.Split(strings.TrimSpace(input), "\n")
  dxs := []int {1, 3, 5, 7, 1}
  dys := []int {1, 1, 1, 1, 2}
  prod := 1
  for i := range dys {
    count := countTrues(lines, dxs[i], dys[i])
    prod *= count
  }
  return strconv.Itoa(prod), nil
}
