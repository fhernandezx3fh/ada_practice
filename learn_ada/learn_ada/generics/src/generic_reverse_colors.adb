with Ada.Text_Io; use Ada.Text_Io;

package body Generic_Reverse_Colors is

  procedure Test_Reverse_Colors is
    generic
      type T is private;
      type Index is range <>;
      type Array_T is array (Index range <>) of T;
    procedure Generic_Reverse_Array (X : in out Array_T);

    procedure Generic_Reverse_Array (X : in out Array_T) is
    begin
      for I in X'First .. (X'Last + X'First) / 2 loop
        declare
          Tmp     : T;
          X_Left  : T renames X (I);
          X_Right : T renames X (X'Last + X'First - I);
        begin
          Tmp     := X_Left;
          X_Left  := X_Right;
          X_Right := Tmp;
        end;
      end loop;
    end Generic_Reverse_Array;

    type Color is (Black, Red, Green, Blue, White);
    type Color_Array is array (Integer range <>) of Color;

    procedure Reverse_Color_Array is new Generic_Reverse_Array (T => Color,
      Index => Integer, Array_T => Color_Array);

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

  end Test_Reverse_Colors;

end Generic_Reverse_Colors;
