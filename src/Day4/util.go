package Day4

import (
  "regexp"
  "strings"
)

var whiteSpace = regexp.MustCompile(`\s`)

type Passport struct {
  Byr string
  Iyr string
  Eyr string
  Hgt string
  Hcl string
  Ecl string
  Pid string
  Cid string
}

func parsePassports(lines []string) []Passport {
  passports := make([]Passport, len(lines))
  for _, data := range lines {
    passportData := whiteSpace.Split(data, -1)
    passport := parsePassport(passportData)
    passports = append(passports, passport)
  }
  return passports
}

func parsePassport(data []string) Passport {
  passport := Passport{}
  for _, part := range data {
    if strings.HasPrefix(part, "byr:") {
      passport.Byr = part[4:]
    } else if strings.HasPrefix(part, "iyr:") {
      passport.Iyr = part[4:]
    } else if strings.HasPrefix(part, "eyr:") {
      passport.Eyr = part[4:]
    } else if strings.HasPrefix(part, "hgt:") {
      passport.Hgt = part[4:]
    } else if strings.HasPrefix(part, "hcl:") {
      passport.Hcl = part[4:]
    } else if strings.HasPrefix(part, "ecl:") {
      passport.Ecl = part[4:]
    } else if strings.HasPrefix(part, "pid:") {
      passport.Pid = part[4:]
    } else if strings.HasPrefix(part, "cid:") {
      passport.Cid = part[4:]
    }
  }
  return passport
}
