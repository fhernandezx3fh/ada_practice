with Ada.Text_Io;         use Ada.Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;

package body Imperative_Language is

  ------------------------------------------------------------------------
  -- Greet
  ------------------------------------------------------------------------
  procedure Greet is
  begin
    --  Print "Hello, World!" to the screen
    Put_Line ("Hello, World!");
  end Greet;

  ------------------------------------------------------------------------
  -- Greet_Loop
  ------------------------------------------------------------------------
  procedure Greet_Loop is
  begin
    loop
      Put_Line ("Please enter your name: ");

      declare
        Name : String := Get_Line;
        --               ^ Call to the Get_Line function
      begin
        exit when Name = "";
        Put_Line ("Hi " & Name & "!");
      end;

      --  Name is undefined here
    end loop;

    Put_Line ("Bye!");
  end Greet_Loop;

  ------------------------------------------------------------------------
  -- Check_Direction
  ------------------------------------------------------------------------
  procedure Check_Positive is
    N : Integer;
  begin
    Put ("Enter an integer value: ");  -- Put a String
    Get (N);  --  Reads in an integer value
    Put (N);  --  Put an Integer
    if N > 0 then
      Put_Line (" is a positive number");
    else
      Put_Line (" is not a positive number");
    end if;
  end Check_Positive;

  ------------------------------------------------------------------------
  -- Check_Positive_2
  --
  -- Conditional String Assignment
  ------------------------------------------------------------------------
  procedure Check_Positive_2 is
    N : Integer;
  begin
    Put ("Enter an integer value: ");  --  Put a String
    Get (N);  --  Reads in an integer value
    Put (N);  --  Put an Integer
    declare
      S : String :=
       (if N > 0 then " is a positive number"
        else " is not a positive number");
    begin
      Put_Line (S);
    end;
  end Check_Positive_2;

  ------------------------------------------------------------------------
  -- Check_Direction
  ------------------------------------------------------------------------
  procedure Check_Direction is
    N : Integer;
  begin
    Put ("Enter an integer value: ");  -- Puts a String
    Get (N);  --  Reads an Integer
    Put (N);  --  Puts an Integer
    if N = 0 or N = 360 then
      Put_Line (" is due east");
    elsif N in 1 .. 89 then
      Put_Line (" is in the northeast quadrant");
    elsif N = 90 then
      Put_Line (" is due north");
    elsif N in 91 .. 179 then
      Put_Line (" is in the northwest quadrant");
    elsif N = 180 then
      Put_Line (" is due west");
    elsif N in 181 .. 269 then
      Put_Line (" is in the southwest quadrant");
    elsif N = 270 then
      Put_Line (" is due south");
    elsif N in 271 .. 359 then
      Put_Line (" is in the southeast quadrant");
    else
      Put_Line (" is not in the range 0..360");
    end if;
  end Check_Direction;

  ------------------------------------------------------------------------
  -- Odd_Even_1
  ------------------------------------------------------------------------
  procedure Odd_Even_1 is
  begin
    for I in 1 .. 10 loop
      Put_Line (if I mod 2 = 0 then "Even" else "Odd");
    end loop;
  end Odd_Even_1;

  ------------------------------------------------------------------------
  -- Odd_Even_2
  ------------------------------------------------------------------------
  procedure Odd_Even_2 is
  begin
    for I in 1 .. 10 loop
      Put_Line
       (case I is when 1 | 3 | 5 | 7 | 9 => I'Img & ": Odd",
         when 2 | 4 | 6 | 8 | 10 => I'Img & ": Even");
    end loop;
  end Odd_Even_2;

end Imperative_Language;
