
# Generate a new ActionScript 3.0 test suite
# This generator can be executed as follows:
# 
#   sprout -n as3 SomeProject
#   cd SomeProject
#   script/generator suite
#
class SuiteGenerator < Sprout::Generator::NamedBase # :nodoc:

  # Get the list of test_cases (which are files) as a 
  # list of class names not fully qualified
  def test_case_classes_short
    @test_case_classes = self.test_cases.dup
    @test_case_classes.collect! do |file|
      actionscript_file_to_short_class_name(file)
    end
    @test_case_classes
  end

  # Transform a file name in the source or test path
  # to a class name not fully qualified
  def actionscript_file_to_short_class_name(file)
    return File.basename(file, '.*')
  end
  
  def manifest
    record do |m|
      m.template 'TestSuite.as', File.join(test_dir, 'AllTests.as'), :collision => :force
    end
  end
  
end
