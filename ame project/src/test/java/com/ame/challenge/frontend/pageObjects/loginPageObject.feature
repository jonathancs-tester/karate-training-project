@ignore

 Feature: Login Page Objects

  Background:

    * call read 'com/ame/challenge/frontend/locators/login.json'

  @LOGIN
  Scenario: Login to Automation Pratice
    * call read('classpath:com/ame/challenge/frontend/utils/driver.feature@URL') {webUrlBase: '#(FRONTEND_BASE_URL)'}
    * call read('classpath:com/ame/challenge/frontend/pageObjects/loginPageObject.feature@EMAIL_INFO')
    * call read('classpath:com/ame/challenge/frontend/pageObjects/loginPageObject.feature@PASSWORD_INFO')
    * call read('classpath:com/ame/challenge/frontend/pageObjects/loginPageObject.feature@SUBMIT_BUTTON')

  @EMAIL_CREATE_INFO
  Scenario: email create an account function
    When input(login.email_created, emailCreatedInfo)

  @EMAIL_INFO
  Scenario: email to login function
    When input(login.email, emailInfo)

  @PASSWORD_INFO
  Scenario: username to login function
    And input(login.password, passInfo)

  @SUBMIT_BUTTON
  Scenario: username to login function
    And submit().click(login.loginButton)

  @SUBMIT_CREATE_BUTTON
  Scenario: username to login function
    And submit().click(login.createButton)