package main

import (
  "fmt"
  "io/ioutil"
  "os"
  "github.com/spf13/cobra"
  "github.com/zylphrex/aoc2020/src/Day1"
  "github.com/zylphrex/aoc2020/src/Day2"
  "github.com/zylphrex/aoc2020/src/Day3"
  "github.com/zylphrex/aoc2020/src/Day4"
)

var rootCmd = &cobra.Command{
  Use: "aoc2020",
  Run: func(cmd *cobra.Command, args []string) {
    bytes, err := ioutil.ReadAll(os.Stdin)
    if err != nil {
      os.Exit(1)
    }

    var f func(string) (string, error)

    if Day == 1 && Part == 1{
      f = Day1.Day1Part1
    } else if Day == 1 && Part == 2 {
      f = Day1.Day1Part2
    } else if Day == 2 && Part == 1 {
      f = Day2.Day2Part1
    } else if Day == 2 && Part == 2 {
      f = Day2.Day2Part2
    } else if Day == 3 && Part == 1 {
      f = Day3.Day3Part1
    } else if Day == 3 && Part == 2 {
      f = Day3.Day3Part2
    } else if Day == 4 && Part == 1 {
      f = Day4.Day4Part1
    }

    if f == nil {
      os.Exit(1)
    }

    result, err := f(string(bytes))
    if err != nil {
      os.Exit(1)
    }
    fmt.Print(result)
  },
}

var Day int
var Part int

func init() {
  rootCmd.PersistentFlags().IntVar(&Day, "day", 0, "The day")
  rootCmd.PersistentFlags().IntVar(&Part, "part", 0, "The part")
}

func main() {
  rootCmd.Execute()
}
