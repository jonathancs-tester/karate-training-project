@ignore

Feature: Browser functions

  @LOAD_DOCUMENT
  Scenario: wait to load the document
    And waitUntil("document.readyState == 'complete'")