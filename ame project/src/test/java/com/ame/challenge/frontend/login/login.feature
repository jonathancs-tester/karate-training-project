@LOGIN

Feature: Login to Automation Store

Scenario: It should be possible to login with email and password valid
  * call read('classpath:com/ame/challenge/frontend/pageObjects/loginPageObject.feature@LOGIN') {emailInfo: 'jonathan@teste.com.br', passInfo: 'teste123'}
  Then match driver.text(login.success) contains 'My account'
  * screenshot()

Scenario: It should not be possible to login with email and password invalid
  * call read('classpath:com/ame/challenge/frontend/pageObjects/loginPageObject.feature@LOGIN') {emailInfo: 'invalid@user.com', passInfo: 'invalid'}
  Then match driver.text(login.error) contains 'There is 1 error'
  * screenshot()

Scenario: It should not be possible to login without email and password
  * call read('classpath:com/ame/challenge/frontend/pageObjects/loginPageObject.feature@LOGIN') {emailInfo: '', passInfo: ''}
  Then match driver.text(login.error) contains 'There is 1 error'
  * screenshot()

