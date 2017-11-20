//Employee david = new Employee(......)

public with sharing class Employee {

	private static Integer nextEmployeeIdNumber = 1;

	private final Integer EMPLOYEE_ID;
	//set this in constructor
	private String title;
	private String firstName;
	private String lastName;
	private Date hireDate;
	private String status;
	private Datetime statusDate;



	public Employee() {
		//IMPLEMENT THIS!
		this.EMPLOYEE_ID = nextEmployeeIdNumber;
		this.title = title;
		this.firstName = firstName;
		this.lastName = lastName;
		this.hireDate = Date.today();
		this.status = 'Active';
		this.statusDate = Datetime.now();
	}

	public Integer getEmployeeId() {
		return EMPLOYEE_ID;
	}

	public void printEmployeeInfo() {
		System.debug('EMPLOYEE_ID: ' + EMPLOYEE_ID);
		System.debug('Title: ' + title);
		System.debug('First Name: ' + firstName);
		System.debug('Last Name: ' + lastName);
		System.debug('Hire Date: ' + hireDate);
		System.debug('Status: ' + status);
		System.debug('Status Date: ' + statusDate);

		//
	}
	// COME BACK TO ALL OTHER REQUIREMENTS
}