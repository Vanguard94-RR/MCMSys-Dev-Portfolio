#! /bin/bash

select car in BMW TESLA VW TOYOTA HYUNDAI EXIT; do
    echo "$car is selected"
    case $car in
    BMW)
        echo "This is a german car manufacturer"
        ;;
    TESLA)
        echo "This is a northamerican electric car manufacturer"
        ;;
    VW)
        echo "This is another german car manufacturer"
        ;;
    TOYOTA)
        echo "This is a japanese car manufacturer"
        ;;
    HYUNDAI)
        echo "This is a korean car manufacturer"
        ;;
    EXIT)
        echo "Exiting"
        break
        ;;
    *)
        echo "Please select a car manufacturer from the list"
        ;;
    esac
done
