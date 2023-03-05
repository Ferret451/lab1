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
  A, B, C, D, RES: TMatrix;
  i, j: byte;
  isCorrectInput: Boolean;

  //A - first input matrix
  //B - second input matrix
  //C, D - matrix for interim results
  //RES - matrix for the final result
  //i, j - iterators for the cycles
  //isCorrectInput - boolean variable to check input for correctness

//Procedure for input the matrixes
Procedure Input(var a, b: TMatrix);
Begin
  writeln('You need to input integer matrixes and then the next expression will be calculated: 2 * (A + B) * (2 * B - A).');
  writeln;
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
Procedure SumMatrixes (const a, b: TMatrix; var c: TMatrix);
Begin
  //Summing the matrixes
  for i := 1 to 3 do
    for j := 1 to 3 do
      c[i][j] := a[i][j] + b[i][j];
End;

//Procedure for substract two matrixes
Procedure SubMatrixes (const a, b: TMatrix; var c: TMatrix);
Begin
  //Substract the matrixes
  for i := 1 to 3 do
    for j := 1 to 3 do
      c[i][j] := a[i][j] - b[i][j];
End;

//Procedure for multiplying number on matrix
Procedure MultConstMatrix(const Numb: byte; const a: TMatrix; var b: TMatrix);
Begin
  //Myltiplying number on matrix
  for i := 1 to 3 do
    for j := 1 to 3 do
      b[i][j] := Numb * a[i][j];
End;

//Procedure for multiplying matrixes
Procedure MultMatrixes(const a, b: TMatrix; var c: TMatrix);
var
  k: byte;

  //k - another iterator for cycles

Begin
  //Myltiplying the matrixes
  for i := 1 to 3 do
    for j := 1 to 3 do
    begin
      c[i][j] := 0;
      for k := 1 to 3 do
        c[i][j] := c[i][j] + a[i][k] * b[k][j];
    end;
End;

//Procedure for outputting interim results
Procedure Output(const Expression: string; const a: TMatrix);
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
  SumMatrixes(A, B, C);
  Output('A + B =', C);

  //2 * (A + B)
  MultConstMatrix(2, C, C);
  Output('2 * (A + B) = ', C);

  //2 * B
  MultConstMatrix(2, B, D);
  Output('2 * B = ', D);

  //2 * B - A
  SubMatrixes(D, A, D);
  Output('2 * B - A = ', D);

  //2 * (A + B) * (2 * B - A)
  MultMatrixes(C, D, RES);
  Output('2 * (A + B) * (2 * B - A) =', RES);

  readln;
  readln;
End.
