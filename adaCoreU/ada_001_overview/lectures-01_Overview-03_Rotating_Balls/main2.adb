with Display;                           use Display;
with Display.Basic;                     use Display.Basic;


procedure main2 is
   type Ball_Type is record
      Shape : Shape_Id;
      X, Y  : Float;
      Step  : Float;
   end record;
   
   procedure Iterate (V : in out Ball_Type) is
   begin
      if V.X > 100.0 then
         V.Step := -1.0;
      elsif V.X < -100.0 then
         V.Step := 1.0;
      end if;

      V.X := Get_X(V.Shape) + V.Step;
      Set_X(V.Shape, V.X);
      
   end Iterate;
   
   B : Ball_Type := 
     (Shape => New_Circle (0.0, 0.0, 10.0, Blue),
      X     => 0.0,
      Y     => 0.0,
      Step  => 1.0);   
begin
   loop
      Iterate (B);    
      
      delay 0.001;
   end loop;
end main2;
