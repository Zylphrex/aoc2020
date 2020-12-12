package Day2

import (
  "strconv"
  "strings"
)

func isValid1(e *Entry) bool {
  count := strings.Count(e.P, e.C)
  return e.A <= count && count <= e.B
}

func Day2Part1(input string) (string, error) {
  entries, err := parseEntries(input)
  if err != nil {
    return "", err
  }

  valids := 0
  for _, entry := range entries {
    if isValid1(entry) {
      valids++
    }
  }
  return strconv.Itoa(valids), nil
}
