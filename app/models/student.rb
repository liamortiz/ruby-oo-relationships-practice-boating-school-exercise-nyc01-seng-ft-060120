class Student

    attr_reader :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def add_boating_test(test_name, status, instructor)
        BoatingTest.new(self, test_name, status, instructor)
    end

    def grade_percentage
        all_tests = BoatingTest.all.select{|test|test.student == self}
        passed_tests = all_tests.select{|test|test.status == "passed"}

        if all_tests.size <= 0
            return "Can't divide by zero"
        end
        (passed_tests.size/all_tests.size).to_f
    end

    def self.all
        @@all
    end

    def self.find_student(first_name)
        @@all.find{|student| student.first_name == first_name}
    end

end
