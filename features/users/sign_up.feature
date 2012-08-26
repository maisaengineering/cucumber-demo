Feature: Sign up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

  In order to sign up, I must enter a valid ICF membership number. The email address I specify in the sign-up form must match the email address in my ICF profile.
  The surname I specify should be the same as the name in my ICF profile.
  My ICF profile can be found at http://nnf.coachfederation.org/profiles/members.aspx?memberID=nnnnnnn where nnnnnnn is my member number.
  Sign-up is confirmed by email to the address in the ICF profile.

  Background:
    Given I am not logged in
    Given I am on the sign-up page

  Scenario Outline: User signs up with correct ICF credentials
    When I choose to register as an ICF credentialed Coach
    When I sign up with <email> and <name> and <member_number> and <password> and <password_confirmation>
    Then I should see <message> message
    Then I should see the new Coachee Profile page
    Then I should see <credential> in my credentials

  Examples:
    |email             |name              |member_number|message                        |password|password_confirmation|credential|
    |kpgarrod@gmail.com|Keith Garrod      |9026152      |a successful sign up           |123abc  |123abc               |ACC       |
    |kpgarrod@gmail.com|KP Garrod         |9026152      |a successful sign up           |123abc  |123abc               |ACC       |
    |lmowen@shaw.ca    |Mary Amohanga     |1021048      |a successful sign up           |abc456  |abc456               |PCC       |


  Scenario Outline: User signs up with incorrect ICF credentials
    When I choose to register as an ICF credentialed Coach
    When I sign up with <email> and <name> and <member_number> and <password> and <password_confirmation>
    Then I should see <message> message
    Then I should see the sign-up page

  Examples:
    |email             |name              |member_number|message                        |password|password_confirmation|
    |kpgarrod@gmail.com|Keith Garrod      |0008999      |an incorrect icf member number |123abc  |123abc               |
    |kpgarrod@yahoo.com|Keith Garrod      |9026152      |an incorrect email             |123abc  |123abc               |
    |kpgarrod@gmail.com|KP Garrod         |9026152      |an invalid email               |123abc  |123abc               |
    |kpgarrod@gmail.com|Keith Garrod      |9026152      |a missing password confirmation|        |123abc               |
    |kpgarrod@gmail.com|Keith Garrod      |9026152      |a mismatched password          |abc123  |123abc               |


  Scenario Outline: User signs up with correct AC credentials
    When I choose to register as an AC credentialed coach
    When I sign up with <email> and <name> and <password> and <password_confirmation>
    Then I should see <message> message
    Then I should see the new Coachee Profile page
    Then I should see <credential> in my credentials

  Examples:
    |email                    |name              |message                        |password|password_confirmation|credential              |
    |trudy@dancingleopards.com|Trudy Arthurs     |a successful sign up           |123abc  |123abc               |Founding Council Member |
    |maureen@theatkins.org.uk |Maureen Atkins    |a successful sign up           |abc123  |abc123               |Member                  |


  Scenario Outline: User signs up with incorrect AC credentials
    When I choose to register as an AC credentialed coach
    When I sign up with <email> and <name> and <password> and <password_confirmation>
    Then I should see <message> message
    Then I should see the sign-up page

  Examples:
    |email                    |name              |message                        |password|password_confirmation|
    |trudy@dancingleopards.com|Keith Garrod      |an incorrect email             |123abc  |123abc               |
    |kpgarrod@gmail           |KP Garrod         |an invalid email               |123abc  |123abc               |
    |trudy@dancingleopards.com|Trudy Arthurs     |a missing password confirmation|        |123abc               |
    |trudy@dancingleopards.com|Trudy Arthurs     |a mismatched password          |abc123  |123abc               |


  Scenario Outline: User signs up as a registered student with valid credentials
    When I choose to register as a registered student on an Accredited Coach Training Program
    When I sign up with <email> and <name> and <password> and <password_confirmation>
    Then I select <training_provider> and <course>
    Then I should see <message> message
    Then An email should be sent to the MyCoachPractice administrator

  Examples:
    |email                    |name              |message               |password|password_confirmation|training_provider         |course                 |
    |kpgarrod@gmail.com       |Keith Garrod      |awaiting confirmation |123abc  |123abc               |Academy of Coaching & NLP |NLP Coach Certification|

  Scenario Outline: User signs up as a registered student with invalid credentials
    When I choose to register as a registered student on an Accredited Coach Training Program
    When I sign up with <email> and <name> and <password> and <password_confirmation>
    Then I select <training_provider> and <course>
    Then I should see <message> message
    Then I should see the sign-up page

  Examples:
    |email                    |name              |message               |password|password_confirmation|training_provider          |course      |
    |trudy@dancingleopards.com|Keith Garrod      |not a coaching program|123abc  |123abc               |Joe Bloggs Training Company|Coaching 101|
