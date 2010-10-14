
class ClassGenerator < Sprout::Generator::NamedBase  # :nodoc:

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
#      m.class_collisions class_dir, "#{class_name}Controller", "#{class_name}ControllerTest", "#{class_name}Helper"

      if(!user_requested_test)
        m.directory full_class_dir
        m.template 'Class.as', full_class_path
      end
 
      m.directory full_test_dir
      m.template 'TestCase.as', full_test_case_path
      
      m.template 'TestSuite.as', File.join(test_dir, 'AllTests.as'), :collision => :force
    end
  end
    
end
