Feature: Contact Form
  Scenario: Successful message
    Given I am on the contact page
    When I complete the contact form with the following values:
      | Name    | John Smith             |
      | Email   | john.smith@example.com |
      | Message | Test message content   |
    Then I should see "Thank you for your message"
    And the following email should be sent:
      | from     | no-reply@bluerare.co.uk     |
      | to       | contact-form@bluerare.co.uk |
      | reply-to | john.smith@example.com      |
      | subject  | New contact form message from John Smith |
      | content  | John Smith <john.smith@example.com> has completed the contact from with: Test message content. |

  Scenario: Invalid message
    Given I am on the contact page
    When I complete the contact form with the following values:
      | Name    | |
      | Email   | john.smith.example.com |
      | Message | |
    Then I should see "Email is invalid"
    And I should see "Name can't be blank"
    And I should see "Content can't be blank"
    And no emails should have been sent
