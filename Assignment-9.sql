-- Assignment pl/sql 1
-- Q1
declare
a int:='&enternuma';
b int:='&enternumb';
c int:='&enternumc';
begin
    if a>b and a>c then
    dbms_output.put_line('A is greatest: '||a);
    elsif b>a and b>c then
    dbms_output.put_line('B is greatest: '||b);
    else
    dbms_output.put_line('C is greatest: '||c);
    end if;
    end;

-- Q2
DECLARE
n int:='&enternum';
begin
    if n mod 2=0 then
    dbms_output.put_line('n is even.');
    else
    dbms_output.put_line('n is odd.');
    end if;
    end;

-- Q3
-- searched case
DECLARE
marks number:='&entermarks';
begin
    case
        when marks>80 then dbms_output.put_line('A grade.');
        when marks>70 then dbms_output.put_line('B grade.');
        when marks>50 then dbms_output.put_line('C grade.');
        when marks>40 then dbms_output.put_line('D grade.');
        when marks<40 then dbms_output.put_line('E grade.');
        else
        dbms_output.put_line('Not passed');
        end case;
        end;

-- Q4
DECLARE
n number:='&enternum';
i number;
begin
    for i in 1..10 loop
    dbms_output.put_line(n|| '*'||i|| '='|| n*i);
    exit when i>10;
    end loop;
    end;

-- Q5
DECLARE
n number:='&enternum';
result int:=1;
i int:=1;
begin
    while i<=n loop
    result:=result*i;
    i:=i+1;
    end loop;
    dbms_output.put_line('Factorial is:'||result);
    end;

-- Q6
DECLARE
    n NUMBER := 10;  -- Length of the Fibonacci series
    a NUMBER := 0;
    b NUMBER := 1;
    c NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Fibonacci Series:');
    DBMS_OUTPUT.PUT_LINE(a);  -- Print the first number (0)
    DBMS_OUTPUT.PUT_LINE(b);  -- Print the second number (1)
    
    FOR i IN 3..n LOOP
        c := a + b;
        DBMS_OUTPUT.PUT_LINE(c);
        a := b;
        b := c;
    END LOOP;
END;

-- Q7
DECLARE
    num NUMBER := 5674;  -- original number
    rev NUMBER := 0;
    digit NUMBER;
BEGIN
    WHILE num > 0 LOOP
        digit := MOD(num, 10);         -- get the last digit
        rev := rev * 10 + digit;       -- append digit to reversed number
        num := TRUNC(num / 10);        -- remove last digit
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Reversed number is ' || rev);
END;

-- Q8
DECLARE
    num1 NUMBER := &enternum1;
    num2 NUMBER := &enternum2;
    a CHAR := '&enterop';
BEGIN
    IF a = '+' THEN
        DBMS_OUTPUT.PUT_LINE('Add: ' || (num1 + num2));
    ELSIF a = '-' THEN
        DBMS_OUTPUT.PUT_LINE('Subtract: ' || (num1 - num2));
    ELSIF a = '*' THEN
        DBMS_OUTPUT.PUT_LINE('Multiply: ' || (num1 * num2));
    ELSIF a = '/' THEN
        IF num2 != 0 THEN
            DBMS_OUTPUT.PUT_LINE('Divide: ' || (num1 / num2));
        ELSE
            DBMS_OUTPUT.PUT_LINE('Division not possible.');
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid operator');
    END IF;
END;

-- Q9
begin
    for i in 1..20 loop
    if i mod 5 = 0 then
    DBMS_OUTPUT.PUT_LINE('Print: '||i);
    exit when i>20;
    end if;
    end loop;
    end;

-- Q10
DECLARE
    greeting NUMBER;
BEGIN
    greeting := TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'));

    IF greeting >= 5 AND greeting < 12 THEN
        DBMS_OUTPUT.PUT_LINE('Good morning!');
    ELSIF greeting >= 12 AND greeting < 17 THEN
        DBMS_OUTPUT.PUT_LINE('Good afternoon!');
    ELSIF greeting >= 17 AND greeting < 21 THEN
        DBMS_OUTPUT.PUT_LINE('Good evening!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Good night!');
    END IF;
END;