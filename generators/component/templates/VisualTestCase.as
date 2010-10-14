package <%= package_name %> 
{

   import org.flexunit.Assert;
   import <%= full_class_name %>;

   public class <%= test_case_name  %>
   {
      private var <%= instance_name %>:<%= class_name %>;

      [Before]
      public function exampleSetUp():void 
      {
         <%= instance_name %> = new <%= class_name %>();
         addChild(<%= instance_name %>);
      }

      [After]
      public function exampleTearDown():void 
      {
         removeChild(<%= instance_name %>);
         <%= instance_name %> = null;
      }

      [Test]
      public function exampleTest():void 
      {
         Assert.assertTrue("<%= instance_name %> is <%= class_name %>", <%= instance_name %> is <%= class_name %>);
      }
   }
   
}