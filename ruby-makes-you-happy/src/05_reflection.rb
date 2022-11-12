class A
  def test
    puts 'test'
  end
end

A.new.test
Object.const_get('A').send('new').send('test')
