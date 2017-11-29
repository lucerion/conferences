#!/usr/bin/env ruby

module A
  def test
  end
end
p A.instance_methods


module C
end

module A
  class B
    include C
  end
end

p A::B.ancestors
p A::B.included_modules


class B
  def public_method
  end

  protected

  def protected_method
  end

  private

  def private_method
  end
end

p B.instance_methods
p B.public_instance_methods
p B.protected_instance_methods
p B.private_instance_methods

p object = B.new
p object.class
p object.instance_of?(A)

p object.methods
p object.public_methods
p object.protected_methods
p object.private_methods


class X
end

class Z < X
end

p Z.superclass
