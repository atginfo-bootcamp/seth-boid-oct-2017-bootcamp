public with sharing class Fish implements Animal {
	public Fish() {
		
	}

	public void speak(){
		System.debug('The dog goes woof');

	}

	public void eat(String typeOfFood){
		System.debug('The dog loves ' + typeOfFood);


	}

	public void die(){
		System.debug('The dies....');


	}	

}