pub fn count_trues(grid: &Vec<String>, dx: usize, dy: usize) -> i64 {
    let mut count = 0;
    let mut x = 0;
    for row in grid.iter().step_by(dy) {
        count += match row.chars().nth(x) {
            Some(c) => if c == '#' {1} else {0},
            None => 0,
        };
        x = (x + dx) % row.len();
    }
    return count;
}
