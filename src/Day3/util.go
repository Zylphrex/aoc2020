package Day3

func countTrues(grid []string, dx, dy int) int {
  count := 0
  for x, y := 0, 0; y < len(grid); x, y = x + dx, y + dy {
    if grid[y][x % len(grid[y])] == '#' {
      count += 1
    }
  }
  return count;
}
