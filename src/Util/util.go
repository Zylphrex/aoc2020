package util

import (
  "strconv"
  "strings"
)

func ParseInts(input string) ([]int, error) {
  lines := strings.Split(input, "\n")
  xs := make([]int, 0, len(lines))

  for _, line := range lines {
    if len(line) == 0 {
      continue
    }

    x, err := strconv.Atoi(line)
    if err != nil {
      return xs, err
    }
    xs = append(xs, x)
  }

  return xs, nil
}
