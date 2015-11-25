
@identify_assignments
Feature: Shopping Online
  Users can do shopping online

  @sanity
  Scenario Outline: I shopping online
    Given I go to "www.walmart.com"
    Then I search "<arg>"
    Then I view the details for the item at index <index>
    Then I add the item into cart and login as "<username>" "<password>"
    Then I go to cart page
    Then I should see the added items
    Then I should see <num> items in shopping cart
    Then I checkout
    Then I choose FREE shipping and address
    Then I am in Payment details page
    Then I go to cart page
    Then I remove the product
    Then I should see <num1> items in shopping cart
    Then I sign out

  Examples:
    | arg    | index | username                | password   | num | num1 |
    | tv     | 1     | sunliang.cn@hotmail.com | test123456 | 1   | 0    |
    | socks  | 1     | sunliang.cn@hotmail.com | test123456 | 1   | 0    |


