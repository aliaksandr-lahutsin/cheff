class uptoyou {
  $foo = [ 'one', 'two', 'three', 'four', 'five' ]

  $foo.each |$value| {
    notify{"The value is: ${value}": } 
    }
}
