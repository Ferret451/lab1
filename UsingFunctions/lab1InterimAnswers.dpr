Program lab1InterimAnswers;

{$APPTYPE CONSOLE}

{
  Using the functions (procedures) the program need to calculate the next
  expression: 2 * (A + B) * (2 * B - A)
}

uses
  System.SysUtils;

//Determining the type for matrixes
Type
  TMatrix = array [1..3, 1..3] of Integer;

Var
  A, B, Temp1, Temp2, RES: TMatrix;

  //A - first input matrix
  //B - second input matrix
  //Temp1, Temp2 - matrix for interim results
  //RES - matrix for the final result

//Procedure for input the matrixes
Procedure Input(var a, b: TMatrix);
var
  i, j: byte;
  isCorrectInput: boolean;

  //i, j - iterators for the cycles
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

  //i, j - iterators for the cycles

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

  //i, j - iterators for the cycles

Begin
  //Substract the matrixes
  for i := 1 to 3 do
    for j := 1 to 3 do
      result[i][j] := a[i][j] - b[i][j];
End;

//Procedure for multiplying number on matrix
Function MultConstMatrix(const Numb: byte; const a: TMatrix): TMatrix;
var
  i, j: byte;

  //i, j - iterators for the cycles

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

  //i, j, k - iterators for the cycles

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

//Procedure for outputting interim results
Procedure Output(const Expression: string; const a: TMatrix);
var
  i, j: byte;

  //i, j - iterators for the cycles

Begin
  writeln(Expression);

  for i := 1 to 3 do
  begin
    for j := 1 to 3 do
      write(a[i][j]:10);
    writeln;
  end;
  writeln;
End;

Begin
  //Inputing the matrixes
  Input(A, B);

  //A + B
  Temp1 := SumMatrixes(A, B);
  Output('A + B =', Temp1);

  //2 * (A + B)
  Temp1 := MultConstMatrix(2, Temp1);
  Output('2 * (A + B) = ', Temp1);

  //2 * B
  Temp2 := MultConstMatrix(2, B);
  Output('2 * B = ', Temp2);

  //2 * B - A
  Temp2 := SubMatrixes(Temp2, A);
  Output('2 * B - A = ', Temp2);

  //2 * (A + B) * (2 * B - A)
  RES := MultMatrixes(Temp1, Temp2);
  Output('2 * (A + B) * (2 * B - A) =', RES);

  readln;
  readln;
End.
