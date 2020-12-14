package Day4

import (
  "regexp"
  "strconv"
  "strings"
)

func Day4Part2(input string) (string, error) {
  lines := strings.Split(strings.TrimSpace(input), "\n\n")
  passports := parsePassports(lines)
  validPassports := make([]Passport, 0)
  for _, passport := range passports {
    if v := isValid2(passport); v {
      validPassports = append(validPassports, passport)
    }
  }
  return strconv.Itoa(len(validPassports)), nil
}

var hex = regexp.MustCompile(`#[0-9a-f]+`)

var EyeColors = []string{
  "amb",
  "blu",
  "brn",
  "gry",
  "grn",
  "hzl",
  "oth",
}

func isValid2(p Passport) bool {
  var num int
  var err error

  num, err = strconv.Atoi(p.Byr)
  if err != nil || num < 1920 || 2002 < num {
    return false
  }

  num, err = strconv.Atoi(p.Iyr)
  if err != nil || num < 2010 || 2020 < num {
    return false
  }

  num, err = strconv.Atoi(p.Eyr)
  if err != nil || num < 2020 || 2030 < num {
    return false
  }

  if strings.HasSuffix(p.Hgt, "cm") {
    num, err = strconv.Atoi(p.Hgt[:len(p.Hgt) - 2])
    if err != nil || num < 150 || 193 < num {
      return false
    }
  } else if strings.HasSuffix(p.Hgt, "in") {
    num, err = strconv.Atoi(p.Hgt[:len(p.Hgt) - 2])
    if err != nil || num < 59 || 76 < num {
      return false
    }
  } else {
    return false
  }

  if v := hex.MatchString(p.Hcl); !v {
    return false
  }

  found := false
  for _, clr := range EyeColors {
    if clr == p.Ecl {
      found = true
      break
    }
  }
  if !found {
    return false
  }

  if len(p.Pid) != 9 {
    return false
  }
  _, err = strconv.Atoi(p.Pid)
  if err != nil {
    return false
  }

  return true
}
