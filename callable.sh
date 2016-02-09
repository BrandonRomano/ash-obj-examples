#!/bin/bash

Objexamples__callable_main(){
    Objexamples__callable_help
}

Objexamples__callable_help(){
    more "$Ash__active_module_directory/HELP.txt"
}

################################################################
# This example illustrates creating new objects
# with `Obj__alloc` and `Obj__init`
################################################################
Objexamples__callable_allocinit(){
    # Creating first object
    brandon=$(Obj__alloc "this.Person")
    Obj__init $brandon 1 "Brandon" 23
    Obj__dump $brandon

    # Creating another object
    kyle=$(Obj__alloc "this.Person")
    Obj__init $kyle 2 "Kyle" 30
    Obj__dump $kyle
}

################################################################
# This example illustrates fetching object public
# members using `Obj__get`
################################################################
Objexamples__callable_get(){
    local brandon=$(Obj__alloc "this.Person")
    Obj__init $brandon 1 "Brandon" 23
    name=$(Obj__get $brandon name)
    id=$(Obj__get $brandon id)
    echo "Person ID: $id"
    echo "Person Name: $name"
}

################################################################
# This example illustrates setting object public members
# using `Obj__set`
################################################################
Objexamples__callable_set(){
    # Creating Object
    local brandon=$(Obj__alloc "this.Person")
    Obj__init $brandon 1 "Brandon" 23
    Logger__warning "User before Obj__set is called:"
    Obj__dump $brandon

    #  Updating Object
    Obj__set $brandon name "Brandon Two"
    Logger__warning "User after Obj__set is called:"
    Obj__dump $brandon
}

################################################################
# This example illustrates calling a method on an Object
################################################################
Objexamples__callable_method(){
    # Initializing object
    local brandon=$(Obj__alloc "this.Person")
    Obj__init $brandon 1 "Brandon" 23
    Logger__warning "User before method is called:"
    Obj__dump $brandon

    # Calling make_older
    Obj__call $brandon make_older
    Obj__call $brandon make_older
    Logger__warning "User after method is called:"
    Obj__dump $brandon
}

################################################################
# This example illustrates that you can use objects
# in normal bash constructs, like functions.
################################################################
Objexamples__callable_function(){
    local brandon=$(Obj__alloc "this.Person")
    Obj__init $brandon 1 "Brandon" 23
    Objexamples_pretty_print_person $brandon
}

##################################
# This function prints out a quick
# blurb about a person.
#
# @param $1: A person object
##################################
Objexamples_pretty_print_person(){
    local person=$1

    local name=$(Obj__get $person name)
    local id=$(Obj__get $person id)
    local age=$(Obj__get $person age)
    Logger__log "This is $name, they are $age years old and are stored in the database under id $id"
}
