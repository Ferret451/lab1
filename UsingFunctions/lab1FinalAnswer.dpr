Program lab1FinalAnswer;

{$APPTYPE CONSOLE}

{
  Using the functions (procedures) the program is need to calculate the next
  expression: 2 * (A + B) * (2 * B - A)
}

Uses
  System.SysUtils;

//Determining the type for matrixes
Type
  TMatrix = array [1..3, 1..3] of Integer;

Var
  A, B, RES: TMatrix;

  //A - first input matrix
  //B - second input matrix
  //RES - result of the expression
  //i, j - iterators for the cycles

//Procedure for input the matrixes
Procedure Input(var a, b: TMatrix);
var
  i, j: byte;
  isCorrectInput: Boolean;

  //i, j - iterators for cycles
  //isCorrectInput - boolean variable to check input for correctness

Begin
  writeln('You need to input matrixes and then the next expression will be calculated: 2 * (A + B) * (2 * B - A).');
  writeln('(the elemets of matrixes must be integer in the range [-2147483647, 2147483647])');
  writeln('Enter the matrix A:');

  //Repeating input matrix A until it's correct
  repeat

    //Making the input correct by default
    isCorrectInput := true;

    //Inputing the matrix A
    for i := 1 to 3 do
      for j := 1 to 3 do
      begin

        //Checking for exceptions
        try
          read(a[i][j]);
        except
          isCorrectInput := false;
        end;

      end;
    writeln;

    //Telling the user that input is incorrect
    if not isCorrectInput then
      writeln('Oops, your input is incorrect. Try again:');

  until isCorrectInput;

  writeln('Enter the matrix B:');

  //Repeating input matrix B until it's correct
  repeat

    //Making the input correct by default
    isCorrectInput := true;

    //Inputing the matrix B
    for i := 1 to 3 do
      for j := 1 to 3 do
      begin

        //Checking for exceptions
        try
          read(b[i][j]);
        except
          isCorrectInput := false;
        end;

      end;
    writeln;

    //Telling the user that input is incorrect
    if not isCorrectInput then
      writeln('Oops, your input is incorrect. Try again:');

  until isCorrectInput;
End;

//Procedure for summing two matrixes
Function SumMatrixes (const a, b: TMatrix): TMatrix;
var
  i, j: byte;

  //i, j - iterators for cycles

Begin
  //Summing the matrixes
  for i := 1 to 3 do
    for j := 1 to 3 do
      result[i][j] := a[i][j] + b[i][j];
End;

//Procedure for substract two matrixes
Function SubMatrixes (const a, b: TMatrix): TMatrix;
var
  i, j: byte;

  //i, j - iterators for cycles

Begin
  //Substract the matrixes
  for i := 1 to 3 do
    for j := 1 to 3 do
      result[i][j] := a[i][j] - b[i][j];

End;

//Procedure for multiplying number on matrix
Function MultConstMatrix(const Numb: integer; const a: TMatrix): TMatrix;
var
  i, j: byte;

  //i, j - iterators for cycles

Begin
  //Myltiplying number on matrix
  for i := 1 to 3 do
    for j := 1 to 3 do
      result[i][j] := Numb * a[i][j];
End;

//Procedure for multiplying matrixes
Function MultMatrixes(const a, b: TMatrix): TMatrix;
var
  i, j, k: byte;

  //i, j, k - iterators for cycles

Begin
  //Myltiplying the matrixes
  for i := 1 to 3 do
    for j := 1 to 3 do
    begin
      result[i][j] := 0;
      for k := 1 to 3 do
        result[i][j] := result[i][j] + a[i][k] * b[k][j];
    end;
End;

//Procedure for output the result
Procedure Output(const a: TMatrix);
var
  i, j: byte;

  //i, j - iterators for cycles

Begin
  for i := 1 to 3 do
  begin
    for j := 1 to 3 do
      write(a[i][j]:11);
    writeln;
  end;
End;

Begin
  //Inputing the matrixes
  Input(A, B);

  //Counting the result
  RES := MultMatrixes(MultConstMatrix(2, SumMatrixes(A, B)), SubMatrixes(MultConstMatrix(2, B), A));

  //Outputing the result
  writeln('2 * (A + B) * (2 * B - A) = ');
  Output(RES);

  readln;
  readln;
End.
