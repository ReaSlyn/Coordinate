# Coordinate
H2 Full-Stack Project

First, pull the project
```
git pull https://github.com/ReaSlyn/Coordinate.git
```

Then cd to Coordinate and install the packages
```
npm i
```

Modify MAMP path to
```
Cooordinate/public/api/
```

and launch the MAMP server, then, connect to the database in localhost :
```
ssh h2fullstack debian@185.189.158.68 -L 3306:127.0.0.1:3306 -N
```

Now you can start the REACT website in the Cooordinate folder with
```
npm start
```

Website will be at http://localhost:3000