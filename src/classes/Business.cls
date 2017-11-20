public with sharing class Business {

	private static String businessName = 'atg';
	private  String locationName;
	private  String address;
	private  String phoneNumber;
	private List<Employee> employees;


	public Business(String locationName, String address, String phoneNumber) {
		//require all fields are passed in
		//set all field values - except employees
		this.locationName = locationName;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.employees = new List<Employee>();
		
	}

	public void addEmployee(Employee employee) {
		//call other addemployee() method to keep business logic centralized
		addEmployee(new List<Employee>{employee});

		//These are 100% identical
		//List<Employee> employees = new List<Employee>();
		//employees.add(employee);
		//addEmployee(employees);

		//List<Employee> employees = new List<Employee>{employee};
		//addEmployee(employees);
	}

	public void addEmployee(List<Employee> employees) {
		// pretend we have a lot of other business logic here
		this.employees.addAll(employees);
	}
	public void removeEmployee(Integer employeeId) {
		//work on this last
		Integer indexToRemove;

		for(Integer i = 0; i < employees.size(); i++){
			if(i == employeeId){
				indexToRemove = i;
			}
		}
		employees.remove(indexToRemove);
	}

	public List<Employee> getEmployees(){
		return employees;
	}

	public Employee getEmployeeById(Integer employeeId) {
		for (Employee employee : employees){
			if(employeeId == employee.getEmployeeId()){
				return employee;
			}	
		}
		return null;	
	}

	public void printLocationInfo() {
		// print out all the location information
		System.debug('Location Name: ' + locationName);
		System.debug('Address: ' + address);
		System.debug('Phone Number: ' + phoneNumber);
		System.debug('Employees: ' + employees);
	}

	/// Work on very last if finished with all other work
	// return TRUE if success, false if employee not found
	public static Boolean transferEmployee(Business fromLocation, Business toLocation, Integer employeeId){
	//HINT: use the getEmployeeById() to find employee on fromLocation
	//remove employee fromLocation
	//add employeee toLocation
	return false;
	}



}