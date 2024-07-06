import pymysql 
from datetime import date,datetime
import os
import uuid

def save_image(image_path):
    if not os.path.exists('images'):
        os.makedirs('images')

    unique_filename = str(uuid.uuid4()) 
    _, file_extension = os.path.splitext(image_path)
    filename = unique_filename + file_extension 

    save_path = os.path.join('images', filename)

    try:
        with open(image_path, 'rb') as f_source:
            with open(save_path, 'wb') as f_destination:
                f_destination.write(f_source.read())
        return filename  

    except IOError as e:
        print(f"Error: {e}")
        return None


conn = pymysql.connect( host='localhost', user='root',  password = "Harshit@123", db='travel', ) 
if conn.open!= 1:
    print('Error Connecting to database')
else:
    cur=conn.cursor()
    while (True):
        print("Write 1 for INSERTION of a new user")
        print("Write 2 for adding new accommodation")
        print("Write 3 for INSERT A NEW DISH AT A LOCATION")
        print("Write 4 for updation of a hotel facilities in a city's all hotels")
        print("Write 5 to update password for a user")
        print("Write 6 to get itenaries according to budget of user")
        print("Write 7 for finding review of an accomodation")
        print("Write 8 for finding most served cuisine at a place")
        print("Write 9 to get the bills of the user")
        print("Write 10 to get users who haven't changed their password in t months")
        print("Write 11 to get travel itenaries which have a duration of t days")
        print("Write 12 for deleting a review given its reviewid")
        print("Write 13 for deleting all reviews made by a user")      
        print("Write 14 for exit")
        print ("Write 15 for opening tables")
        a=int(input())
        if(a==1):
            user_id=int(input("user_id:"))
            while True:
                cur.execute(f"Select * From USER_DETAILS Where user_id={user_id}")
                user_exists = cur.fetchone()
                if user_exists:
                    print("User ID already exists. Please choose a different ID.")
                    user_id=int(input("user_id:"))
                else:
                    break
            username=input("username:")
            email=input("emailid:")
            password=input("password:")
            DOB=input("Insert date of birth in YYYY-MM-DD format")
            try:
                converted_date = datetime.strptime(DOB, "%Y-%m-%d")
                change_pass = date.today()
                year_diff = change_pass.year - converted_date.year - ((change_pass.month, change_pass.day) < (converted_date.month, converted_date.day))
                insert_query = f"INSERT INTO USER_DETAILS(user_id, username, email, pass, DOB, Date_change_pass, age) VALUES ({user_id}, '{username}', '{email}', '{password}', '{converted_date}', '{change_pass}', {year_diff})"
                cur.execute(insert_query)
                conn.commit()
                print("User details inserted successfully.")

            except ValueError as e:
                print("Error:", e)
                cur.rollback()
            continue
        elif a == 2:
            cur.execute("SELECT MAX(accommodation_id) FROM ACCOMODATIONS")
            max_user_id = cur.fetchone()
            if max_user_id[0] is not None:
                accommodation_id = int(max_user_id[0]) + 1
            else:
                accommodation_id = 1
            
            accommodation_name = input("give accommodation name")
            type_of_accommodation = input("give accommodation type")
            location = input("location")
            
            cur.execute("SELECT destination_id FROM TRAVEL_DESTINATIONS WHERE destination_name = %s", (location,))
            location_id = cur.fetchone()
            
            if location_id:
                is_massage_provided = input("Is massage provided? (Yes/No): ")
                is_buffet_provided = input("Is buffet provided? (Yes/No): ")
                is_swimming_pool_present = input("Is swimming pool present? (Yes/No): ")
                AC_rooms_provided = input("Are AC rooms provided? (Yes/No): ")
                extra_services = input("Enter extra services (if any): ")
                extra_services = None if extra_services.strip() == '' else extra_services
                cost = int(input("Enter cost: "))

                insert_accommodation_query = "INSERT INTO ACCOMODATIONS (accommodation_id, accommodation_name, type_of_accomodation, location, is_massage_provided, is_buffet_provided, is_swimming_pool_present, AC_rooms_provided, extra_services, cost) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                cur.execute(insert_accommodation_query, (accommodation_id, accommodation_name, type_of_accommodation, location_id[0], is_massage_provided, is_buffet_provided, is_swimming_pool_present, AC_rooms_provided, extra_services, cost))
                conn.commit()
            else:
                cur.execute("SELECT MAX(destination_id) FROM TRAVEL_DESTINATIONS")
                max_user_id = cur.fetchone()
                if max_user_id[0] is not None:
                    location_id = int(max_user_id[0]) + 1
                else:
                    location_id = 1

                description = input("Would you like to give a description about the destination? If yes, enter a description. Else, type NO.")
                if description == "NO":
                    description = None
                
                image = input("give path for image if no image give NO")
                path = save_image(image) if image != "NO" else None
                cur.execute(f"INSERT INTO TRAVEL_DESTINATIONS (destination_id, destination_name, descriptions, image) VALUES ('{location_id}', '{location}', '{description}', '{path}')")

                is_massage_provided = input("Is massage provided? (Yes/No): ")
                is_buffet_provided = input("Is buffet provided? (Yes/No): ")
                is_swimming_pool_present = input("Is swimming pool present? (Yes/No): ")
                AC_rooms_provided = input("Are AC rooms provided? (Yes/No): ")
                extra_services = input("Enter extra services (if any): ")
                extra_services = None if extra_services.strip() == '' else extra_services
                cost = int(input("Enter cost: "))
                insert_accommodation_query = "INSERT INTO ACCOMODATIONS (accommodation_id, accommodation_name, type_of_accomodation, location, is_massage_provided, is_buffet_provided, is_swimming_pool_present, AC_rooms_provided, extra_services, cost) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                cur.execute(insert_accommodation_query, (accommodation_id, accommodation_name, type_of_accommodation, location_id, is_massage_provided, is_buffet_provided, is_swimming_pool_present, AC_rooms_provided, extra_services, cost))
                conn.commit()
            continue

        elif a == 3:
            cuisine_name = input("enter cuisine name")
            dish_name = input("enter the dish name")
            location_id = int(input("enter location id"))
            
            cur.execute("SELECT * FROM CUISINES WHERE cuisine_name = %s", (cuisine_name,))
            cuisine_exists = cur.fetchone()
            
            cur.execute("SELECT MAX(dish_id) FROM FAMOUS_DISHES")
            max_dish_id = cur.fetchone()
            if max_dish_id[0] is not None:
                dish_id = int(max_dish_id[0]) + 1
            else:
                dish_id = 1

            if cuisine_exists:
                cur.execute("INSERT INTO FAMOUS_DISHES (dish_id, cuisine_id, dish_name) VALUES (%s, %s, %s)", (dish_id, cuisine_exists[0], dish_name))
            else:
                description = input("enter description of cuisine. If no description is to be given, enter NO.")
                description = None if description == "NO" else description
                
                cur.execute("SELECT MAX(cuisine_id) FROM CUISINES")
                max_cuisine_id = cur.fetchone()
                if max_cuisine_id[0] is not None:
                    cuisine_id = int(max_cuisine_id[0]) + 1
                else:
                    cuisine_id = 1

                cur.execute("INSERT INTO CUISINES (cuisine_id, cuisine_name, cuisine_desc) VALUES (%s, %s, %s)", (cuisine_id, cuisine_name, description))
                cur.execute("INSERT INTO CUISINE_AT_DESTINATIONS (destination_id, cuisine_types) VALUES (%s, %s)", (location_id, cuisine_name))
                cur.execute("INSERT INTO FAMOUS_DISHES (dish_id, cuisine_id, dish_name) VALUES (%s, %s, %s)", (dish_id, cuisine_id, dish_name))

            cur.execute("INSERT INTO DISHES_AT_LOCATION (dish_id, location) VALUES (%s, %s)", (dish_id, location_id))
            conn.commit()

        elif a==4:
            locationid=int(input("enter locationid"))
            is_massage_provided = input("Is massage provided? (Yes/No): ")
            is_swimming_pool_present = input("Is swimming pool present? (Yes/No): ")
            cur.execute(f"UPDATE ACCOMODATIONS SET is_massage_provided = '{is_massage_provided}', is_swimming_pool_present = '{is_swimming_pool_present}' WHERE location = '{locationid}';")
            conn.commit()
        elif a==5:
            userid=int(input("enter userid"))
            cur.execute(f"Select pass From USER_DETAILS Where user_id={userid}")
            user_exists = cur.fetchone()
            password=input("enter password")

            if(user_exists[0]==password):
                new_password=input("enter new password")
                cur.execute(f"UPDATE USER_DETAILS SET pass = '{new_password}', Date_change_pass = CURRENT_DATE WHERE user_id = '{userid}';")
                conn.commit()
            else:
                print("password incorrect")

        elif a==6:
            min=int(input("enter minimum"))
            max=int(input("enter maximum"))
            locationid=int(input("enter destination locationid"))
            print("i.itinerary_id")
            cur.execute(f" SELECT i.itinerary_id from TRAVEL_ITINERARY as i where i.itinerary_id in (SELECT DISTINCT si.itinerary_id from SEGMENT_IN_ITINERARY as si JOIN SEGMENTS as s on si.segment_id = s.segment_id where s.destination = '{locationid}') AND i.cost < '{max}' AND i.cost > '{min}' ;")
            a=cur.fetchall()
            # print(a)
            
            for i in a:
                if(i):
                    print(i[0])

        elif a==7:
            accommodation_id=(int(input("enter accomodation id")))
            print("r.rating , r.review_desc")
            cur.execute(f"SELECT r.rating , r.review_desc from REVIEWS as r JOIN ACCOMODATION_REVIEW as ar on ar.review_id = r.review_id where ar.accommodation_id={accommodation_id};")
            a=cur.fetchall()

            for i in a:
                if(i):
                    print(i[0],i[1])
        elif a==8:
            locationid=int(input("enter location"))
            print("c.cuisine_name")
            cur.execute(f"SELECT c.cuisine_name FROM CUISINES AS c WHERE c.cuisine_id = ( SELECT f.cuisine_id FROM FAMOUS_DISHES AS f JOIN DISHES_AT_LOCATION AS d ON d.dish_id = f.dish_id WHERE d.location = '{locationid}' GROUP BY f.cuisine_id ORDER BY COUNT(f.cuisine_id) DESC LIMIT 1);")
            a=cur.fetchone()
            if a:
                print(a[0])

        elif a==9:
            userid=int(input("enter userid"))
            print("TRAVEL_ITINERARY.itinerary_id, TRAVEL_DETAILS.user_id, TRAVEL_ITINERARY.cost")
            cur.execute(f"SELECT  TRAVEL_ITINERARY.itinerary_id, TRAVEL_DETAILS.user_id, TRAVEL_ITINERARY.cost FROM TRAVEL_DETAILS JOIN TRAVEL_ITINERARY ON TRAVEL_DETAILS.itinerary_id = TRAVEL_ITINERARY.itinerary_id WHERE TRAVEL_DETAILS.user_id='{userid}';")
            a=cur.fetchall()
            for i in a:
                if(i):
                    print(i[0],i[1],i[2])
        elif a==10:
            t=input("enter the vale of t in months")
            query = f"DESCRIBE USER_DETAILS"
            cur.execute(query)

            column_names = [row[0] for row in cur.fetchall()]
            print(column_names)
            cur.execute(f"SELECT * FROM USER_DETAILS WHERE Date_change_pass < DATE_SUB(NOW(),INTERVAL '{t}' MONTH);")
            a=cur.fetchall()
            for i in a:
                print(i[0],i[1],i[2],i[3],i[4])

        elif a==11:
            t=input("give the value of t days")
            query = f"DESCRIBE TRAVEL_ITINERARY"
            cur.execute(query)

            column_names = [row[0] for row in cur.fetchall()]
            print(column_names)
            cur.execute(f"SELECT* from TRAVEL_ITINERARY WHERE DATEDIFF(end_date,start_date)='{t}';")
            a=cur.fetchall()
            for i in a:
                if(i):
                    print(i[0],i[1],i[2],i[4])
        elif a==12:
            t=input("give the reviewid")
            cur.execute(f"DELETE FROM EXPERIENCE_REVIEW WHERE review_id='{t}'")
            cur.execute(f"DELETE FROM ACCOMODATION_REVIEW WHERE review_id='{t}'")
            cur.execute(f"DELETE FROM DESTINATION_REVIEW WHERE review_id='{t}'")
            cur.execute(f"DELETE FROM REVIEWS WHERE review_id='{t}'")
            conn.commit()
        elif a==13:
            user=input("give the userid")
            cur.execute(f"SELECT review_id FROM REVIEWS WHERE user_id='{user}'")
            a=cur.fetchall()
            for i in a:
                t=i[0]
                cur.execute(f"DELETE FROM EXPERIENCE_REVIEW WHERE review_id='{t}'")
                cur.execute(f"DELETE FROM ACCOMODATION_REVIEW WHERE review_id='{t}'")
                cur.execute(f"DELETE FROM DESTINATION_REVIEW WHERE review_id='{t}'")
                cur.execute(f"DELETE FROM REVIEWS WHERE review_id='{t}'")
            conn.commit()            
        elif a==14:
            break
        elif a==15:
            cur.execute("show tables;")
            a=cur.fetchall()
            if a:
                for i in a:
                    print(i[0])
            tablename=input("get state of table")
            query = f"DESCRIBE {tablename}"
            cur.execute(query)

            column_names = [row[0] for row in cur.fetchall()]
            print(column_names)
            cur.execute(f"Select * FROM {tablename}")
            a=cur.fetchall()

            if a:
                for row in a:
                        print(row)


