Feature: CRUD for employee
#Seguindo os padrões de testes automatizados cada scenario é indepedente do outro.

 Background:
	* url BACKEND_URL

Scenario: Create a employee
	* call read('classpath:com/ame/challenge/backend/features/EmployeeHandler.feature@CREATE') { name : 'Jonathan', salary : '6000', age: '30'}

Scenario: Check if a employee exists
	* call read('classpath:com/ame/challenge/backend/features/EmployeeHandler.feature@CREATE') { name : 'Jonathan', salary : '6000', age: '30'}
	* def employeeId = response.data.id
	* call read('classpath:com/ame/challenge/backend/features/EmployeeHandler.feature@READ') { employeeId : '#(employeeId)'}

Scenario: Delete a employee
 	* call read('classpath:com/ame/challenge/backend/features/EmployeeHandler.feature@CREATE') { name : 'Jonathan', salary : '6000', age: '30'}
	* def employeeId = response.data.id
 	* call read('classpath:com/ame/challenge/backend/features/EmployeeHandler.feature@DELETE') { employeeId : '#(employeeId)'}

