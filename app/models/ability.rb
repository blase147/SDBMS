class Ability
  include CanCan::Ability

  def initialize(staff)
    staff ||= Staff.new # Guest staff (not logged in)

    if staff.has_role?(:administrator)
      can :manage, :all # Admin staff can manage everything
    elsif staff.has_role?(:teacher)
      can :read, Staff # Teachers can read staff members
      can :manage, Student # Teachers can manage students
      # Define other abilities for teachers as needed
    elsif staff.has_role?(:human_resource)
      can :manage, Staff # Human resource staff can manage staff members
      can :manage, Student # Human resource staff can manage students
      can :manage, Parent # Human resource staff can manage parents
      can :manage, Recruitment # Human resource staff can manage recruitment
      can :manage, Department # Human resource staff can manage departments
      can :manage, Expenditure # Human resource staff can manage expenditures
      can :manage, Inventory # Human resource staff can manage inventory
      can :manage, Revenue # Human resource staff can manage revenue
      can :manage, Salary # Human resource staff can manage salaries
      # Define other abilities for HR staff as needed
    elsif staff.has_role?(:accountant)
      can :manage, Staff # Accountants can manage staff members
      can :manage, Student # Accountants can manage students
      can :manage, Fee # Accountants can manage fees
      # Define other abilities for accountants as needed
    elsif staff.has_role?(:front_desk)
      can :manage, Visitor # Front desk staff can manage visitors
      can :manage, Event # Front desk staff can manage events
      can :manage, Attendance # Front desk staff can manage attendance
      can :manage, Inventory # Front desk staff can manage inventory
      # Define other abilities for front desk staff as needed
    else
      can :read, :all # Guests can read everything
      # Define abilities for guests here. For example:
      # can :read, Staff
      # can :read, Student
    end
  end
end
