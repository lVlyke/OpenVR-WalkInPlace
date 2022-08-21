Steps to create setup OpenVR-WalkInPlace

### initial screen
![Example Screenshot](ovrwip_init.png)

### click on 'Tracked Devices Page'
![Example Screenshot](ovrwip_step1.png)

### Select your preferred devices used to match movement model
![Example Screenshot](ovrwip_step2.png)

### return to initial page and click on 'New Data Model'
![Example Screenshot](ovrwip_step3.png)

### enter a name for your data model
### then proceed to follow the instructions:
```
The data model creation process takes ~30 seconds 5 seconds for each phase.
The process records walking,jogging,running and other movements that disable input, such as ducking etc.
~25 seconds for movements you want to trigger input and 5 seconds for movements you want to disable input.
The process starts with slowest (walking), increass to medium (jogging) and increases to fast (running).
Do not stop moving during the walking,jogging,running phases.
If you do it will be recorded and used as a valid movement model.
You can always try it, view it, recreate it, if you dont have the pattern you like.
```


### There will be popup messages with a countdown when each phase will occur

*Here is an example alert going from step jogging tracking increasing to running tracking, (There is a full jogging and running stage, this is a stage that tracks any pace between the two)*
![Example Screenshot](ovrwip_step4.PNG)


### Once you have completed all stages of the data model it will automatically return to the initial page
### You then select your preferred data model from the dropdown
### and Click 'apply' and 'Enable WIP'
![Example Screenshot](ovrwip_step5.PNG)

### Once you check 'Enable WIP' the 'ovrwip_controller' virtual controller will be created 
*You will see an additional controller added in SteamVR like this*
![Example Screenshot](new_controller.png)

### You then will get virtual input based on your data model 
### Then you can create SteamVR input bindings described here
https://github.com/pottedmeat7/OpenVR-WalkInPlace/tree/master/docs/screenshots/steamvr_bindings/Readme.md