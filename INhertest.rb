
class A
 @@b=0
 attr_accessor :c
 @c=33
 def print
 printf "%d %d\n", @@b, @c
 end
end

class B < A
 def initialize() 
  @@b=1
 end
end

class C < A
 def initialize()
  @@b=2
 end
end

b=B.new()
c=C.new()

b.print
c.print
