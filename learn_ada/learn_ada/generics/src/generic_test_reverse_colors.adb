with Ada.Text_Io; use Ada.Text_Io;

package body Generic_Test_Reverse_Colors is

  procedure Test_Reverse_Colors is

    generic
      type T is private;
      type Index is range <>;
      type Array_T is array (Index range <>) of T;
    procedure Generic_Reverse_Array (X : in out Array_T);

    generic
      type T is private;
      type Index is range <>;
      type Array_T is array (Index range <>) of T;
      S : String;
      with function Image (E : T) return String is <>;
      with procedure Test (X : in out Array_T);
    procedure Perform_Test (X : in out Array_T);

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

    procedure Perform_Test (X : in out Array_T) is
    begin
      for C of X loop
        Put_Line (S & ": " & Image (C));
      end loop;

      New_Line;
      Put_Line ("Testing " & S & "...");
      New_Line;
      Test (X);

      for C of X loop
        Put_Line (S & ": " & Image (C));
      end loop;
    end Perform_Test;

    type Color is (Black, Red, Green, Blue, White);
    type Color_Array is array (Integer range <>) of Color;

    procedure Reverse_Color_Array is new Generic_Reverse_Array (T => Color,
      Index => Integer, Array_T => Color_Array);

    procedure Perform_Test_Reverse_Color_Array is new Perform_Test (T => Color,
      Index => Integer, Array_T => Color_Array, S => "My_Color",
      Image => Color'Image, Test => Reverse_Color_Array);

    My_Colors : Color_Array (1 .. 5) := (Black, Red, Green, Blue, White);

  begin
    Perform_Test_Reverse_Color_Array (My_Colors);
  end Test_Reverse_Colors;

end Generic_Test_Reverse_Colors;
