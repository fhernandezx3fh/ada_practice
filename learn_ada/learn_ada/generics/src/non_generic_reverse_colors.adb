with Ada.Text_Io; use Ada.Text_Io;

package body Non_Generic_Reverse_Colors is

  procedure Test_Non_Generic_Reverse_Colors is
    type Color is (Black, Red, Green, Blue, White);

    type Color_Array is array (Integer range <>) of Color;

    procedure Reverse_Color_Array (X : in out Color_Array);

    --      The procedure Reverse_Color_Array takes an array of colors,
    --      starts by swapping the first and last elements of the array,
    --      and continues doing that with successive elements until it
    --      reaches the middle of array. at that point, the
    --      entire array has been reversed,
    --      as we see from the output of the test program.
    procedure Reverse_Color_Array (X : in out Color_Array) is
    begin
      for I in X'First .. (X'Last + X'First) / 2 loop
        declare
          Tmp     : Color;
          X_Left  : Color renames X (I);
          X_Right : Color renames X (X'Last + X'First - I);
        begin
          Tmp     := X_Left;
          X_Left  := X_Right;
          X_Right := Tmp;
        end;
      end loop;
    end Reverse_Color_Array;

    My_Colors : Color_Array (1 .. 5) := (Black, Red, Green, Blue, White);

  begin
    for C of My_Colors loop
      Put_Line ("My_Color: " & Color'Image (C));
    end loop;

    New_Line;
    Put_Line ("Reversing My_Color...");
    New_Line;
    Reverse_Color_Array (My_Colors);

    for C of My_Colors loop
      Put_Line ("My_Color: " & Color'Image (C));
    end loop;

  end Test_Non_Generic_Reverse_Colors;

end Non_Generic_Reverse_Colors;
