with Generic_Instantiation; use Generic_Instantiation;
with Generic_Package;       use Generic_Package;
with Formal_Subprogram;     use Formal_Subprogram;
with Stack;                 use Stack;
with Generic_Test_Reverse_Colors; Use Generic_Test_Reverse_Colors;

procedure Main is

begin
  --  Insert code here.
  Show_Generic_Instantiation;
  Show_Generic_Package;
  Show_Formal_Subprogram;

  Test_Reverse_Colors;
end Main;
