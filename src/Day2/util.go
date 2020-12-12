package Day2

import (
  "strconv"
  "strings"
)

type Entry struct {
  A int
  B int
  C string
  P string
}

func (e *Entry) isValid() bool {
  count := strings.Count(e.P, e.C)
  return e.A <= count && count <= e.B
}

func parseEntry(line string) (*Entry, error) {
  parts := strings.Split(line, " ")
  xs := strings.Split(parts[0], "-")
  a, err := strconv.Atoi(xs[0])
  if err != nil {
    return nil, err
  }
  b, err := strconv.Atoi(xs[1])
  if err != nil {
    return nil, err
  }
  c := string(parts[1][0])
  p := string(parts[2])
  return &Entry{a, b, c, p}, nil
}

func parseEntries(input string) ([]*Entry, error) {
  lines := strings.Split(input, "\n")
  entries := make([]*Entry, 0, len(lines))
  for _, line := range lines {
    if len(line) == 0 {
      continue
    }

    entry, err := parseEntry(line)
    if err != nil {
      return entries, err
    }
    entries = append(entries, entry)
  }

  return entries, nil
}
