unit BasicDataTypes;

interface

uses
   Graphics, SysUtils;

type
   TRGB32 = packed record
      B, G, R, A: byte;
   end;
   TRGB32Array = packed array[0..MaxInt div SizeOf(TRGB32) - 1] of TRGB32;
   PRGB32Array = ^TRGB32Array;

   TTempView_Item = record
      X:      integer;
      Y:      integer;
      colour: tcolor;
      colour_used: boolean;
   end;

   PByte     = ^byte;
   PWord     = ^word;
   PLongWord = ^longword;

   TTempView = array of TTempView_Item;

   TDatabuffer = array of byte;

   THeader = record
      A: word; {Unknown}
      Width, Height,    {Width and Height of the images}
      NumImages: word;{Number of images}
   end;

   THeader_Image = record
      x, y, cx, cy: word; {cx and cy are width n height of stored image}
      compression: byte;
      align: array [0..2] of byte;
      RadarColor : TColor;
      zero, offset: longint; {Unknown}
   end;

   TFrameImage = array of array of byte;

   EFileError = class(Exception);

   TSelectArea = record
      X1, Y1, X2, Y2: integer;
   end;

type
   TPoint2D = record
      X, Y: integer;
   end;

type
   TSelectData = record
      SourceData, DestData: TSelectArea;
      HasSource:    boolean;
      MouseClicked: TPoint2D;
   end;

   TCache = array [0..255] of byte;


   // Imported from 3.4 OS_SHP_Document Engine
   // Temporarily Here For Compatibility
   TObjectData_Item = record
      X:      integer;
      Y:      integer;
      colour: tcolor;
      colour_used: boolean;
   end;
   TObjectData = array of TObjectData_Item;

   {$IF CompilerVersion > 28}
   Char8 = AnsiChar;
   PChar8 = PAnsiChar;
   {$ELSE}
   Char8 = Char;
   PChar8 = PChar;
   {$ENDIF}

implementation

end.
