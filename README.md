# Mine UI 

A user interface for managing Minecraft servers.

## Notice
This is my freshman effort at developing a program from the ground up, so please be nice.

## Planned Features

This program will eventually run in a docker container, and broadcast its user interface over a webpage. One of the advantages of using the Flutter framework is that converting to one kind of medium to another is relatively easy. My goals for this program are as follows:

* Provide an overview page giving a bird's eye view of all running servers.
* Provide a page for viewing details of a server, running or not, and edit its various settings files, based on the server type.
* A page for adding a server, and the capability of adding from multiple sources (FTB, Curseforge, zip file, existing folder).
* Provide a page for adjusting global settings.

## To-Do List

1. Create a panel for developer tasks, such as:
    
    * Reseting each database individually
    * Deleting server entries 

1. Add the ability to manually add a server

    - [ ] Create add server form
    - [x] Create an adapter to store the server object in the hive database. 
    - [x] Create a hive database for the server object.

1. Standardize the reuseable widgets
    - [ ] Text 
    - [ ] Slider 
    - [ ] Switch
    - [ ] List tiles