public with sharing class AnimalGod {

public static void handlesAnimals() {
	Dog myDog = new Dog();
	Fish myFish = new Fish();

	doAnimalStuff(mydog, 'Cheeze-its(tm)');
	doAnimalStuff(myfish, 'bubbles');
}


	public static void doAnimalStuff(Animal animal, String typeOfFood){
		animal.speak();
		animal.eat(typeOfFood);
	}


}