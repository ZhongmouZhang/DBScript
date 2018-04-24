DECLARE
  CURSOR c_emp IS
    SELECT *
    FROM   test;
  v_row c_emp%ROWTYPE;
BEGIN
  Dbms_Flashback.Enable_At_Time('28-DEC-2006 03:15:00PM');
  OPEN c_emp;
  Dbms_Flashback.Disable;

  LOOP 
    FETCH c_emp INTO v_row; 
    EXIT WHEN c_emp%NOTFOUND; 
    INSERT INTO test VALUES
    (v_row.id, v_row.name); 
  END LOOP; 
  CLOSE c_emp;
  COMMIT;
END;
