# Ojoolu_Restaurants_Review_App_Backend
API for Ojoolu Restaurants Review App

#Set up
- yarn istall
- tsc --init
- edit tsconfig.json file thus: "target": "es2016" => "target": "es2020" 
  - "rootDir": "./src",
  - "outDir": "./dist", 
  -  add "includes":["src"]
- add start command to package.json file thus: start": "ts-node src/app.ts",
