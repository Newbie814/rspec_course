class Person 
  def allocate
    sleep(3)
    "Hello"
  end
end



RSpec.describe Person do
  describe 'regular double' do
    it 'can implement any method' do
      person = double(a: "Hello", b: 20)
      expect(person.a).to eq("Hello")
    end
  end

  describe 'instance or verifying double' do
    it 'can only implement methods that are defined on the class' do
      # person = instance_double(Person, a: "Hello", b: 20) # will fail because Person class does not have a method called b
      person = instance_double(Person)
      allow(person).to receive(:a).and_return("Hello")
    end
  end
  
end