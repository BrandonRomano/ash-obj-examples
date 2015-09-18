#!/bin/bash

Objexamples__callable_main(){
    Logger__warning "Creating Person Objects"

    # Creating first object
    brandon=$(Obj__alloc "Person")
    Obj__init $brandon 1 "Brandon" 23
    Obj__dump $brandon

    # Creating another object
    kyle=$(Obj__alloc "Person")
    Obj__init $kyle 2 "Kyle" 40
    Obj__dump $kyle

    # Updating Brandon
    Logger__warning "Updating Brandon Object"
    Obj__set $brandon name "Brandon Romano"
    Obj__set $brandon id 3
    Obj__dump $brandon

    # Making older
    Logger__warning "Updating Brandon Older!"
    Obj__call $brandon make_older
    Obj__call $brandon make_older
    Obj__dump $brandon

    Obj__dump $kyle
}
