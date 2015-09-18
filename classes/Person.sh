#!/bin/bash
# This is a simple class that represents a Person.

# These are public member variables.  They are accessible
# through the `Obj__get`.  Member variables should only ever be
# accessed through this method, and never directly!  These are
# determined as public, as these variables start with the class
# name and are proceeded with two underscores: `Person__`
Person__id=""
Person__name=""
Person__age=""

# This is a private member variable.  They are not accessible
# outside of the class, but can be helpful to use within
# methods.  This is determined as private as the variable starts
# with the class name and is proceeded with a single underscore:
# `Person_`.
#
# Here we have a silly variable that counts the
# number of times we've made this object older.
Person_birthdays_count=0

################################################################
# This is the constructor for a Person.  This is called when
# creating a new instance of a Person.
#
# This is intended to illustrate the usage of a constructor.
# It is correct to pass any number of parameters to the
# constructor.  Using this example, our alloc/init would look
# like this:
#
# brandon=$(Obj__alloc "Person")
# Obj__init $brandon 1 "Brandon" 23
#
# If we were using no parameters to this constructor, the init
# line would simply be `Obj__init $brandon`
#
# @param $1: The id of the person
# @param $2: The name of the person
# @param $3: The age of the person
################################################################
Person__construct(){
    Person__id="$1"
    Person__name="$2"
    Person__age="$3"
}

################################################################
# This method will increment the person's age by one.
#
# This method is intended to illustrate the usage of a
# public method.  A method is public if it starts with the
# class name, and is followed by two underscores.
#
# When we have a pointer to a person, this method would be
# called like this: `Obj__call $person make_older`
################################################################
Person__make_older(){
    Person__age=$((Person__age+1))
    Person_update_birthday_count
}

################################################################
# This method will update the birthday count of the user.
#
# This method is intended to illustrate the usage of a
# private method.  A method is private if it starts with the
# class name, and is followed by a single underscore.
################################################################
Person_update_birthday_count(){
    Person_birthdays_count=$((Person_birthdays_count+1))
    echo "Happy Birthday $Person__name!"
    echo "This is birthday #$Person_birthdays_count we have celebrated with $Person__name."; echo
}
