Sixteenth Ruby on Rails Bootcamp assignment.

An app made to demonstrate model callbacks.

Has 3 models: Company, Employee, and Count.
  - A Company has many Employees and has one Count.
  - Employees belong to a Company.
  - A Count belongs to a Company.
    - Count has employee_count and manager_count fields.
    - Callbacks are set up to increment/decrement these counts when Employees are added or removed to a Company.
    - Count fields are used in views to display numbers of Employees for each Company.

Uses RSpec for testing.
  - Includes 2 tests for testing Employee counts
  - Tests located in: ``spec\models\employee_spec.rb``
