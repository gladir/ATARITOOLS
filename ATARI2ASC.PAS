{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2024
  @website(https://www.gladir.com/ataritools)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Program ATARI2ASC;

Var
 Source,Target:Text;
 C:Char;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('ATARI2ASC - Cette commande permet de convertir un ',
                      'un fichier Atari 8 bits en ASCII.');
  WriteLn;
  WriteLn('Syntaxe: ATARI2ASC [/?] input.bas output.lst');
  WriteLn;
  WriteLn(' input.lst   Indique le nom du fichier Atari Ö traiter');
  WriteLn(' output.bas  Indique le nom du fichier traiter');
 End
  Else
 If ParamCount>0 Then Begin
  {$I-}Assign(Source,ParamStr(1));
  Reset(Source);{$I+}
  If IOResult<>0 Then BEgin
   WriteLn('Impossible de lire le fichier : ',ParamStr(1));
   Halt(2);
  End;
  {$I-}Assign(Target,ParamStr(2));
  Rewrite(Target);{$I+}
  If IOResult<>0 Then Begin
   WriteLn('Impossible d''Çcrire le fichier : ',ParamStr(2));
   Halt(3);
  End;
  While Not EOF(Source)do Begin
   Read(Source,C);
   If C=#155 Then Write(Target,#10)
             Else Write(Target,C);
  End;
  Close(Target);
  Close(Source);
 End
  Else
 Begin
  WriteLn('Paramätre attendue !');
  Halt(1);
 End;
END.
