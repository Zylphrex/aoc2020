package Day3

import (
  "strconv"
  "strings"
)

func Day3Part1(input string) (string, error) {
  lines := strings.Split(strings.TrimSpace(input), "\n")
  count := countTrues(lines, 3, 1)
  return strconv.Itoa(count), nil
}
