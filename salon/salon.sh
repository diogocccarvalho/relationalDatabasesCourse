#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU() {
    # Display services
    SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
    echo "$SERVICES" | while read SERVICE_ID BAR NAME
    do
        echo "$SERVICE_ID) $NAME"
    done

    # Get service selection
    read SERVICE_ID_SELECTED

    # Validate service
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_NAME ]]
    then
        MAIN_MENU "\nI could not find that service. What would you like today?"
    else
        # Get phone number
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        
        # Check for existing customer
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        
        # New customer handling
        if [[ -z $CUSTOMER_NAME ]]
        then
            echo -e "\nI don't have a record for that phone number, what's your name?"
            read CUSTOMER_NAME
            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        fi
        
        # Get time
        FORMATTED_NAME=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')
        FORMATTED_SERVICE=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')
        echo -e "\nWhat time would you like your $FORMATTED_SERVICE, $FORMATTED_NAME?"
        read SERVICE_TIME
        
        # Create appointment
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
        
        # Confirmation message
        echo -e "\nI have put you down for a $FORMATTED_SERVICE at $SERVICE_TIME, $FORMATTED_NAME."
    fi
}

MAIN_MENU
