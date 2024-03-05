SUCCESS=0
FAIL=0
TEST_FILE="test.txt"
DIF_RES=""

for var in -b -e -n -s -t -v
do
    TEST_1_FLAGS="$var $TEST_FILE" 
    cat $TEST_1_FLAGS > original_cat$TC_NAME.log
    ./s21_cat $TEST_1_FLAGS > s21_cat$TC_NAME.log

    DIF_RES="$(diff -s original_cat$TC_NAME.log s21_cat$TC_NAME.log)"

    if [ "$DIF_RES" == "Files original_cat$TC_NAME.log and s21_cat$TC_NAME.log are identical" ]
        then
        (( SUCCESS++ ))
        echo $TEST_1_FLAGS  "RESULT: SUCCESS ✅" 
        else
        (( FAIL++ ))
        echo $TEST_1_FLAGS  "RESULT: FAIL ❌"
    fi
    rm original_cat$TC_NAME.log s21_cat$TC_NAME.log
done

for var in -b -e -n -s -t -v
do
    for var2 in -b -e -n -s -t -v
    do
        if [ $var != $var2 ]
        then
            TEST_2_FLAGS="$var $var2 $TEST_FILE" 
            cat $TEST_1_FLAGS > original_cat$TC_NAME.log
            ./s21_cat $TEST_1_FLAGS > s21_cat$TC_NAME.log

            DIF_RES="$(diff -s original_cat$TC_NAME.log s21_cat$TC_NAME.log)"

            if [ "$DIF_RES" == "Files original_cat$TC_NAME.log and s21_cat$TC_NAME.log are identical" ]
                then
                (( SUCCESS++ ))
                echo $TEST_2_FLAGS  "RESULT: SUCCESS ✅" 
                else
                (( FAIL++ ))
                echo $TEST_2_FLAGS  "RESULT: FAIL ❌"
            fi
            rm original_cat$TC_NAME.log s21_cat$TC_NAME.log
         fi
    done
done

for var in -b -e -n -s -t -v
do
  for var2 in -b -e -n -s -t -v
  do
      for var3 in -b -e -n -s -t -v
      do
        if [ $var != $var2 ] && [ $var2 != $var3 ] && [ $var != $var3 ]
        then
        TEST_3_FLAGS="$var $var2 $var3 $TEST_FILE" 
        cat $TEST_3_FLAGS > original_cat$TC_NAME.log
        ./s21_cat $TEST_3_FLAGS > s21_cat$TC_NAME.log

        DIF_RES="$(diff -s original_cat$TC_NAME.log s21_cat$TC_NAME.log)"

        if [ "$DIF_RES" == "Files original_cat$TC_NAME.log and s21_cat$TC_NAME.log are identical" ]
            then
            (( SUCCESS++ ))
            echo $TEST_3_FLAGS  "RESULT: SUCCESS ✅" 
            else
            (( FAIL++ ))
            echo $TEST_3_FLAGS  "RESULT: FAIL ❌"
        fi
        rm original_cat$TC_NAME.log s21_cat$TC_NAME.log

        fi
      done
  done
done

for var in -b -e -n -s -t -v
do
  for var2 in -b -e -n -s -t -v
  do
      for var3 in -b -e -n -s -t -v
      do
          for var4 in -b -e -n -s -t -v
          do
            if [ $var != $var2 ] && [ $var2 != $var3 ] && [ $var != $var3 ] && [ $var != $var4 ] && [ $var2 != $var4 ] && [ $var3 != $var4 ]
            then
              TEST_3_FLAGS="$var $var2 $var3 $var4 $TEST_FILE" 
              cat $TEST_3_FLAGS > original_cat$TC_NAME.log
              ./s21_cat $TEST_3_FLAGS > s21_cat$TC_NAME.log

              DIF_RES="$(diff -s original_cat$TC_NAME.log s21_cat$TC_NAME.log)"

              if [ "$DIF_RES" == "Files original_cat$TC_NAME.log and s21_cat$TC_NAME.log are identical" ]
              then
                (( SUCCESS++ ))
                echo $TEST_3_FLAGS  "RESULT: SUCCESS ✅" 
              else
                (( FAIL++ ))
                echo $TEST_3_FLAGS  "RESULT: FAIL ❌"
              fi
              rm original_cat$TC_NAME.log s21_cat$TC_NAME.log

            fi
          done
      done
  done
done

echo "SUCCESS: $SUCCESS"
echo "FAIL: $FAIL"

