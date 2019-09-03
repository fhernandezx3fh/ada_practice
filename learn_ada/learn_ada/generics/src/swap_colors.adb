package body swap_colors is

  procedure Test_Non_Generic_Swap_Colors is
   type Color is (Black, Red, Green, Blue, White);

   procedure Swap_Colors (X, Y : in out Color);

   procedure Swap_Colors (X, Y : in out Color) is
      Tmp : constant Color := X;
   begin
      X := Y;
      Y := Tmp;
   end Swap_Colors;

   A, B, C : Color;
begin
   A := Blue;
   B := White;
   C := Red;

   Put_Line ("Value of A is " & Color'Image (A));
   Put_Line ("Value of B is " & Color'Image (B));
   Put_Line ("Value of C is " & Color'Image (C));

   New_Line;
   Put_Line ("Swapping A and C...");
   New_Line;
   Swap_Colors (A, C);

   Put_Line ("Value of A is " & Color'Image (A));
   Put_Line ("Value of B is " & Color'Image (B));
   Put_Line ("Value of C is " & Color'Image (C));
end Test_Non_Generic_Swap_Colors;

end swap_colors;
