package body Swap_Colors is

  procedure Test_Swap_Colors is
    generic
      type T is private;
    procedure Generic_Swap (X, Y : in out T);

    procedure Generic_Swap (X, Y : in out T) is
      Tmp : constant T := X;
    begin
      X := Y;
      Y := Tmp;
    end Generic_Swap;

    type Color is (Black, Red, Green, Blue, White);

    procedure Swap_Colors is new Generic_Swap (T => Color);

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
  end Test_Swap_Colors;

end Swap_Colors;
