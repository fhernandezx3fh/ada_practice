--  The following code has a few errors. Correct them.

--  with Display;       use Display; 
--  with Display.Basic; use Display.Basic;
--  
--  procedure Main2 is
--     Shape_Id : Ball := New_Circle 
--       (X      => 0.0,
--        Y      => 0.0,
--        Radius => 10.0,
--        Color  => Blue);
--     Float : Step := 0.05;
--  begin
--     loop
--        if (Get_Y (Ball) > 100.0) then
--           Step := -0.05;
--        else if Get_Y (Ball) < -100 then
--           Step := 0.05;
--        end if;
--        
--        Set_Y (Ball, Get_X (Ball) + Step);
--        
--        delay 0.001;
--     end loop;   
--  end Main2;
   
   
with Display;       use Display; 
with Display.Basic; use Display.Basic;

procedure Main2 is
   Ball : Shape_Id := New_Circle 
     (X      => 0.0,
      Y      => 0.0,
      Radius => 10.0,
      Color  => Blue);
   Step : Float := 0.05;
begin
   loop
      if (Get_Y (Ball) > 100.0) then
         Step := -0.05;
      elsif Get_Y (Ball) < -100.0 then
         Step := 0.05;
      end if;
      
      -- This statement doesn't do much
      --Set_Y (Ball, Get_X (Ball) + Step);
      
      Set_Y (Ball, Get_Y (Ball) + Step);
      
      delay 0.001;
   end loop;   
end Main2;
