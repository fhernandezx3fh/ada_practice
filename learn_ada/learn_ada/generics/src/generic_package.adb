with Ada.Text_Io; use Ada.Text_Io;

package body Generic_Package is

  procedure Show_Generic_Package is

--------------------------------------------------------------------------
-- Package Definition / Spec START
--------------------------------------------------------------------------
    generic
      type T is private;
    package Element is

      procedure Set (E : T);
      procedure Reset;
      function Get return T;
      function Is_Valid return Boolean;

      Invalid_Element : exception;

    private
      Value : T;
      Valid : Boolean := False;
    end Element;

--------------------------------------------------------------------------
-- Package Definition / Spec END
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- Package Definition / Body START
--------------------------------------------------------------------------

    package body Element is

      procedure Set (E : T) is
      begin
        Value := E;
        Valid := True;
      end Set;

      procedure Reset is
      begin
        Valid := False;
      end Reset;

      function Get return T is
      begin
        if not Valid then
          raise Invalid_Element;
        end if;
        return Value;
      end Get;

      function Is_Valid return Boolean is (Valid);

    end Element;

--------------------------------------------------------------------------
-- Package Definition / Body END
--------------------------------------------------------------------------

    package I is new Element (T => Integer);

    procedure Display_Initialized is
    begin
      if I.Is_Valid then
        Put_Line ("Value is initialized");
      else
        Put_Line ("Value is not initialized");
      end if;
    end Display_Initialized;

  begin
    Display_Initialized;

    Put_Line ("Initializing...");
    I.Set (5);
    Display_Initialized;
    Put_Line ("Value is now set to " & Integer'Image (I.Get));

    Put_Line ("Reseting...");
    I.Reset;
    Display_Initialized;

  end Show_Generic_Package;
end Generic_Package;
