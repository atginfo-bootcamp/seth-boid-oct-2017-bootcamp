public with sharing class LocationManagement {



	public static void createLocationAndEmployee(){
		//Business__c missoulaLocation = createLocation('Missoula', '216 W Main\nMissoula, MT 59801', '406-123-4567');
		//insert missoulaLocation;

		//List<Employee__cz> employees = new List<Employee__c>();

		//employees.add(createEmployee(missoulaLocation, 'Seth', 'Boid', 'Active', 'Janitor'));
		//employees.add(createEmployee(missoulaLocation, 'Seth', 'BoldHead', 'Active', 'Janitor'));

		//insert employees;

		Business__c missoulaLocation = createLocation('St. Louis', '123 Fake St\nSt. Louis, MO 59801', '406-123-4567');
		insert missoulaLocation;

		List<Employee__c> employees = new List<Employee__c>();

		employees.add(createEmployee(missoulaLocation, 'Some', 'Name', 'Active', 'Janitor'));
		employees.add(createEmployee(missoulaLocation, 'Other', 'Name', 'Active', 'Janitor'));

		insert employees;		

	}

	public static void queryAndLogData() {
		List<Employee__c> employeesByLocationId = getEmployeesByLocationId('a001I000003FZmq');
		System.debug('employeesByLocationId: ' + employeesByLocationId);

		List<Employee__c> employeesByLocationName = getEmployeesByLocationName('Missoula');
		System.debug('employeesByLocationName: ' + employeesByLocationName);

		Business__c locationAndEmployees = getLocationAndEmployees('a001I001003FZmq');
		System.debug('locationAndEmployees: ' + locationAndEmployees);


	}

	public static Business__c createLocation(String name, String address, String phone){
		return createLocation('Advanced Technology Group', name, address, phone);
	}

	public static Business__c createLocation(String businessName, String name, String address, String phone){
		Business__c location = new Business__c();

		location.Business_Name__c = 'Advanced Technology Group';
		location.Name = name;
		location.Address__c = address;
		location.Phone_Number__c = phone;

		return location;
	}

	public static Employee__c createEmployee(Business__c location, String firstName, String lastName, String status, String title){
		Employee__c employee = new Employee__c();

		employee.Business_Location__c = location.Id;
		employee.First_Name__c = firstName;
		employee.Last_Name__c = lastName;
		employee.Status__c = status;
		employee.Title__c = title;
		employee.Status_Date__c = Datetime.now();
		employee.Hire_Date__c = Date.today();


		return employee;
	}
	
	public static List<Employee__c> getEmployeesByLocationId (Id locationId) {
		List<Employee__c> employees = [
			SELECT Id, Name, Business_Location__c, First_Name__c, Last_Name__c, Status__c, Title__c, Hire_Date__c, Status_Date__c
			FROM Employee__c
			WHERE Business_Location__c = :locationId
		];
		return employees;
	}

	public static List<Employee__c> getEmployeesByLocationName (String locationName) {
		List<Employee__c> employees = [
			SELECT Id, Name, Business_Location__c, First_Name__c, Last_Name__c, Status__c, Title__c, Hire_Date__c, Status_Date__c
			FROM Employee__c
			WHERE Business_Location__r.Name = :locationName
		];
		return employees;
	}

	public static Business__c getLocationAndEmployees (Id locationId) {
		Business__c location = [
			SELECT Business_Name__c, Name, Address__c, Phone_Number__c,
				(SELECT Id, Name, Business_Location__c, First_Name__c, Last_Name__c, Status__c, Title__c, Hire_Date__c, Status_Date__c
				FROM Employees__r)
			FROM Business__c
			WHERE Id = :locationId
		];
		return location;
	}

	public static List<Employee__c> getEmployeesByEmployeeId (String employeeId) {
		List<Employee__c> employees = [
			SELECT Id, Name, Business_Location__c, First_Name__c, Last_Name__c, Status__c, Title__c, Hire_Date__c, Status_Date__c
			FROM Employee__c
			WHERE Name = :employeeId
		];
		return employees;
	}
	public static Employee__c transferEmployeeLocation(String employeeId, Id targetLocationId){

		List<Employee__c> foundEmployees = getEmployeesByEmployeeId(employeeId);

		if(foundEmployees.size() != 0) {
			Employee__c employee = foundEmployees[0];
			employee.Business_Location__c = targetLocationId;

			update employee;

			return employee;
		}

		return null;
	}

	public static void updateStatusDateOnStatusChange(List<Employee__c> employees, Map<Id, Employee__c> oldEmployeeMap){

		for(Employee__c employee : employees) {
			Employee__c oldEmployee = oldEmployeeMap.get(employee.Id);
			if(employee.Status__c != oldEmployee.Status__c){
				employee.Status_Date__c = Datetime.now();
			}
		}		

	}

}