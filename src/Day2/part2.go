package Day2

import (
  "strconv"
)

func isValid2(e *Entry) bool {
  a := e.A - 1
  b := e.B - 1
  return (string(e.P[a]) == e.C) != (string(e.P[b]) == e.C)
}

func Day2Part2(input string) (string, error) {
  entries, err := parseEntries(input)
  if err != nil {
    return "", err
  }

  valids := 0
  for _, entry := range entries {
    if isValid2(entry) {
      valids++
    }
  }
  return strconv.Itoa(valids), nil
}
