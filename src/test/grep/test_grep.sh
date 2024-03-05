SUCCESS=0
FAIL=0
TEST_COUNTER=1
TC_NAME=""
TEST_CASE=""
FLAGS=""
PATTERN=""
FILE=""

function clear_vars(){
    FLAGS=""
    PATTERN=""
    FILE=""
}

#function run_test(){
 #   $TEST_CASE > original_grep$TC_NAME.log
 #   ./s21_$TEST_CASE > s21_grep$TC_NAME.log
#}

function main(){
    
    $TEST_CASE > original_grep$TC_NAME.log
    ./s21_$TEST_CASE > s21_grep$TC_NAME.log

    DIF_RES="$(diff -s original_grep$TC_NAME.log s21_grep$TC_NAME.log)"

    if [ "$DIF_RES" == "Files original_grep$TC_NAME.log and s21_grep$TC_NAME.log are identical" ]
        then
        (( SUCCESS++ ))
        (( TEST_COUNTER++ ))
        echo $TEST_CASE" Test:"$TC_NAME "Result: SUCCESS ✅" 
        else
        (( FAIL++ ))
        (( TEST_COUNTER++ ))
        echo $TEST_CASE" Test:"$TC_NAME "Result: FAIL ❌"
    fi
}

#--------------------------------------------------
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-e"
PATTERN="sed"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
main
#--------------------------------------------------
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-e"
PATTERN="a"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
main
#--------------------------------------------------
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-e"
PATTERN="a -e sed"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
main
#--------------------------------------------------
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-e"
PATTERN="a -e at"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main
#--------------------------------------------------
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-e"
PATTERN="-i"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main
#--------------------------------------------------
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-v"
PATTERN="lorem"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main
#--------------------------------------------------
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-c"
PATTERN="lorem"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main
#--------------------------------------------------
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-l"
PATTERN="lorem"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main
#--------------------------------------------------
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-l"
PATTERN="lorem"
FILE="1.txt 2.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main
#--------------------------------------------------
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-l"
PATTERN="quam"
FILE="1.txt 2.txt 3.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main
#-------------------------------------------------- 10
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-n"
PATTERN="quam"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main
#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-n"
PATTERN="lorem"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-n"
PATTERN="lorem"
FILE="1.txt 2.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-n"
PATTERN="lorem"
FILE="1.txt 2.txt 3.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main
#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-h"
PATTERN="lorem"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-h"
PATTERN="amet"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-h"
PATTERN="lorem"
FILE="1.txt 2.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-h"
PATTERN="quam"
FILE="1.txt 2.txt 3.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-s"
PATTERN="quam"
FILE="nothing.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
rm example.txt
echo "lorem" > example.txt
FLAGS="-f"
PATTERN="example.txt"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main
#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
rm example.txt
echo "lorem" > example.txt
echo "ipsum" >> example.txt
FLAGS="-f"
PATTERN="example.txt"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
rm example.txt
echo "lorem" > example.txt
FLAGS="-f"
PATTERN="example.txt"
FILE="1.txt 2.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
rm example.txt
echo "lorem" > example.txt
echo "quam" > example.txt
FLAGS="-f"
PATTERN="example.txt"
FILE="1.txt 2.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-o"
PATTERN="lorem"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-iv"
PATTERN="lorem"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-ic"
PATTERN="lorem"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-ic"
PATTERN="lorem"
FILE="1.txt 2.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-in"
PATTERN="lorem"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-ih"
PATTERN="lorem"
FILE="1.txt 2.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
rm example.txt
echo "lorem" > example.txt
TC_NAME=$TEST_COUNTER
FLAGS="-if"
PATTERN="example.txt"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
rm example.txt
echo "lorem" > example.txt
TC_NAME=$TEST_COUNTER
FLAGS="-if"
PATTERN="example.txt"
FILE="1.txt 2.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-io"
PATTERN="lorem"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-vc"
PATTERN="lorem"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-vl"
PATTERN="lorem"
FILE="1.txt 2.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-vn"
PATTERN="lorem"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-vh"
PATTERN="lorem"
FILE="1.txt 2.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-vo"
PATTERN="lorem"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-cl"
PATTERN="lorem"
FILE="1.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-cn"
PATTERN="lorem"
FILE="1.txt 2.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-ch"
PATTERN="amet"
FILE="1.txt 2.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main
#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-co"
PATTERN="lorem"
FILE="1.txt 2.txt 4.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main
#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-ln"
PATTERN="lorem"
FILE="1.txt 2.txt 4.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-lh"
PATTERN="lorem"
FILE="1.txt 2.txt 4.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-lh"
PATTERN="lorem"
FILE="1.txt 2.txt 4.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

#-------------------------------------------------- 
clear_vars
TC_NAME=$TEST_COUNTER
FLAGS="-lo"
PATTERN="lorem"
FILE="1.txt 2.txt 4.txt"
TEST_CASE="grep $FLAGS $PATTERN $FILE"
rm -rf *.log
main

rm -rf *.log
rm -rf example.txt
echo "SUCCES: $SUCCESS"
echo "FAIL: $FAIL"