CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
cd student-submission
    if [[ -f ListExamples.java ]]
        then 
            echo 'student-submission found'
        else
            echo 'need file student-submission'
            exit 1
    fi

mkdir submission_test_dir
cp ListExamples.java submission_test_dir/
cp ../TestListExamples.java submission_test_dir/

javac -cp $CPATH *.java

set +e
    if [[ $? -eq 0 ]]
        then 
            echo 'compilation success'
        else
            echo 'compilation error, check for possible syntax errors, type errors
                                                and class path errors'
    fi        
        
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples