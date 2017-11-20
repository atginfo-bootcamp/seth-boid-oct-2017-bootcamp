/**
* Person CLass
* A class is made up of the following 3 elements:
* 
* class level priorities 
* constructor method
* all other methods 
* 
*/


public class Person {
	//Static variables are shared across ALL INSTANCES
	private static Boolean isHuman = true;

	private String name;
	private String email;
	private String gender;
	private Double weight;
	private Integer age;
	private final Boolean IS_DEAD;

	public Person(String defaultName) {
		name = defaultName;
		IS_DEAD = false;
		//alternate syntax
		//this.name = defaultName;
		
	}
	/**
	* Overloaded Constructor
	* Person fred = new Person('fred', 'foo@bar.com')
	*/
		public Person(String defaultName, String defaultEmail){
		name = defaultname;
		email = defaultEmail;
		IS_DEAD = false;
	}

	public Person(String defaultName, String defaultEmail, Boolean defaultIsDead){
		name = defaultname;
		email = defaultEmail;
		IS_DEAD = defaultIsDead;
	}



	public void print(){
		System.debug('Person name: ' + name);
		System.debug('Person email: ' + email);
		System.debug('Person gender: ' + gender);
		System.debug('Person weight: ' + weight);
		System.debug('Person age: ' + age);
		System.debug('Person isDead: ' + IS_DEAD);
		System.debug('Person isHuman: ' + isHuman);

	}

	public String getName(){
		return name;
	}
	public String getEmail(){
		return email;
	}
	public String getGender(){
		return gender;
	}
	public Double getWeight(){
		return weight;
	}
	public Integer getAge(){
		return age;
	}		

	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public void setAge(Integer age) {
		this.age = age;
	}	

	public void setIsHuman(Boolean isHumanVal) {
		isHuman = isHumanVal;
	}


}