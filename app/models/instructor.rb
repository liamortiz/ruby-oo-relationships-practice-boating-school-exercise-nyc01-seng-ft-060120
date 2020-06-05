class Instructor

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    #1. Does a boating test exist w/ this name & for this student
    #2. If yes, updated status to passing
    #3. If no, create new test with students name and that test_name, and set status to passing

    def pass_student(student, test_name)
        change_status("passed", student, test_name)
    end

    def fail_student(student, test_name)
        change_status("failed", student, test_name)
    end

    def self.all
        @@all
    end

    private
    def change_status(status, student, test_name)
        test_exists = BoatingTest.all.find{|test| test.test_name == test_name}
        if test_exists
            test_exists.status = status
        else
            BoatingTest.new(student, test_name, test, self)
        end
    end
end
