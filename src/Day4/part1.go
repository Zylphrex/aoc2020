package Day4

import (
  "strconv"
  "strings"
)

func Day4Part1(input string) (string, error) {
  lines := strings.Split(strings.TrimSpace(input), "\n\n")
  passports := parsePassports(lines)
  validPassports := make([]Passport, 0)
  for _, passport := range passports {
    if v := isValid1(passport); v {
      validPassports = append(validPassports, passport)
    }
  }
  return strconv.Itoa(len(validPassports)), nil
}

func isValid1(p Passport) bool {
  return p.Byr != "" &&
    p.Iyr != "" &&
    p.Eyr != "" &&
    p.Hgt != "" &&
    p.Hcl != "" &&
    p.Ecl != "" &&
    p.Pid != ""
}
