#!/usr/bin/env ruby

increment = ->(x) { x + 1 }
p increment.call(1)
p [1, 2, 3].map(&increment)
