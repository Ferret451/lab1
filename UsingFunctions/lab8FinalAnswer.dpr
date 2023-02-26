Program lab8FinalAnswer;

{$APPTYPE CONSOLE}

Uses
  System.SysUtils;

//Determining the type for matrixes
Type
  TMatrix = array [1..3, 1..3] of Integer;

Var
  A, B, C: TMatrix;
  i, j: byte;
  isCorrectInput: Boolean;

  //A - first input matrix
  //B - second input matrix
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
Function SumMatrixes (a, b: TMatrix): TMatrix;
var
  res: TMatrix;

  //res - result of sum

Begin
  //Summing the matrixes
  for i := 1 to 3 do
    for j := 1 to 3 do
      res[i][j] := a[i][j] + b[i][j];

  result := res;
End;

//Procedure for substract two matrixes
Function SubMatrixes (a, b: TMatrix): TMatrix;
var
  res: TMatrix;

  //res - result of substract

Begin
  //Substract the matrixes
  for i := 1 to 3 do
    for j := 1 to 3 do
      res[i][j] := a[i][j] - b[i][j];

  result := res;
End;

//Procedure for multiplying number on matrix
Function MultConstMatrix(Numb: byte; a: TMatrix): TMatrix;
var
  res: TMatrix;

  //res - result of sum

Begin
  //Myltiplying number on matrix
  for i := 1 to 3 do
    for j := 1 to 3 do
      res[i][j] := Numb * a[i][j];

  result := res;
End;

//Procedure for multiplying matrixes
Function MultMatrixes(a, b: TMatrix): TMatrix;
var
  res: TMatrix;
  k: byte;

  //res - result of sum
  //k - another iterator for cycles

Begin
  //Myltiplying the matrixes
  for i := 1 to 3 do
    for j := 1 to 3 do
    begin
      res[i][j] := 0;
      for k := 1 to 3 do
        res[i][j] := res[i][j] + a[i][k] * b[k][j];
    end;

  result := res;
End;

//Procedure for output the result
Procedure Output(a: TMatrix);
Begin
  for i := 1 to 3 do
  begin
    for j := 1 to 3 do
      write(a[i][j]:10);
    writeln;
  end;
End;

Begin
  //Inputing the matrixes
  Input(A, B);

  //Counting the result
  C := MultMatrixes(MultConstMatrix(2, SumMatrixes(A, B)), SubMatrixes(MultConstMatrix(2, B), A));

  //Outputing the result
  writeln('2 * (A + B) * (2 * B - A) = ');
  Output(C);


  readln;
  readln;
End.
