#!  /bin/bash

echo "================================FSTAB EDITOR FOR NFS SHARES================================"
echo "========You are about to modify the fstab file to comment all lines with NFS shares========"
echo "===This is done by using a sed command, additionally it takes a backup of the fstab file==="
echo "================================Do you want to continue?: ================================="
select answer1 in YES NO; do

    case $answer1 in
    YES)
        sleep .5
        echo "=====FSTAB file before modifications====="
        sleep .5
        echo
        cat fstab-test.txt
        echo
        sleep 2
        echo "=====Editing fstab line that contains NFS shares====="
        sleep 2
        sed -E -i.bak '/^([^# ].*)?nfs/  s/^/#/' fstab-test.txt
        echo
        echo "=====FSTAB file after modifications====="
        echo
        cat fstab-test.txt
        sleep 2
        echo
        echo "=====Done editing====="
        sleep .5
        break
        ;;
    NO)
        echo "=====Exiting program without any modifications.====="
        break
        ;;
    esac
done
