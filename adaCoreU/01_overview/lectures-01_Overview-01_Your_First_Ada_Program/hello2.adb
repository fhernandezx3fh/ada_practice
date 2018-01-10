-- The following code has a few errors in it. Correct it.

--  with Ada.Text_IO;
--  
--  procedure Hello is
--     A, B : Integer;
--  
--     A = Integer'Image (Ada.Text_IO.Get_Line);
--     B = Integer'Image (Ada.Text_IO.Get_Line);
--  
--     if A == B then
--        Ada.Text_IO.Put_Line ("A EQUALS B, VALUE IS " & A);
--     end if;
--  end Hello;




with Ada.Text_IO;

procedure Hello2 is
  
   A, B : Integer;

begin
   A := Integer'Value (Ada.Text_IO.Get_Line);
   B := Integer'Value (Ada.Text_IO.Get_Line);

   if A = B then
      Ada.Text_IO.Put_Line ("A EQUALS B, VALUE IS " & Integer'Image(A));
   end if;
end Hello2;
