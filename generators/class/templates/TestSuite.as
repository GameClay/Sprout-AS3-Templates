package 
{

   /**
    * This file has been automatically created using
    * #!/usr/bin/ruby script/generate suite
    * If you modify it and run this script, your
    * modifications will be lost!
    */

   import org.flexunit.runners.Suite;<% test_case_classes.each do |test_case|  %>
   import <%= test_case %>;<% end  %>

   [Suite]
   [RunWith("org.flexunit.runners.Suite")]
   public class AllTests
   {<% test_case_classes_short.each_with_index do |test_case, index|  %>
      public var test<%= index %>: <%= test_case %><% end  %>
   }
   
}
