# SWITCH DB
show dbs
use my-first-db

# CREATE DOCUMENTS IN STUDENTS COLLECTION
db.students.insertOne({
    name: "Bobby",
    home_state: "TX",
    lucky_number: 6,
    birthday: {
        month: 3,
        day: 1,
        year: 1991
    }
})

db.students.insertOne({
    name: "Marty",
    home_state: "CA",
    lucky_number: 85,
    birthday: {
        month: 6,
        day: 12,
        year: 1968
    }
})

db.students.insertOne({
    name: "Luke",
    home_state: "WA",
    lucky_number: 1,
    birthday: {
        month: 12,
        day: 25,
        year: 19
    }
})

db.students.insertOne({
    name: "Bubbles",
    home_state: "ME",
    lucky_number: 21,
    birthday: {
        month: 4,
        day: 20,
        year: 1973
    }
})

db.students.insertOne({
    name: "Vincent",
    home_state: "CA",
    lucky_number: 11,
    birthday: {
        month: 7,
        day: 4,
        year: 1960
    }
})

# GET ALL
db.students.find()

# GET ALL FROM CA
db.students.find({home_state: "CA"})

# GET ALL STUDENTS WHOS LUCKY NUM IS > 3
db.students.find({lucky_number: {$gt: 3}})

# ADD INTERESTS FIELD
db.students.updateMany(
    {},
    {$set: {interests: ['coding', 'brunch', 'MongoDB']}}
)

# ADD UNIQUE INTERESTS
db.students.update(
    {name: "Bobby"},
    {$push: {interests: "React"}}
)

db.students.update(
    {name: "Marty"},
    {$push: {interests: "Time Travel"}}
)

db.students.update(
    {name: "Luke"},
    {$push: {interests: "Light Swords"}}
)

db.students.update(
    {name: "Bubbles"},
    {$push: {interests: "Cats"}}
)

db.students.update(
    {name: "Vincent"},
    {$push: {interests: "Royal with Cheese"}}
)

# ADD TAXES TO INTERESTS
db.students.update(
    {name: "Bobby"},
    {$push: {interests: "taxes"}}
)

# REMOVE TAXES FROM INTERESTS
db.students.update(
    {name: "Bobby"},
    {$pull: {interests: "taxes"}}
)

# REMOVE ALL STUDENTS FROM CA
db.students.deleteMany(
    {home_state: "CA"}
)

# REMOVE STUDENT BY NAME
db.students.findOneAndDelete({name: "Bubbles"})

# REMOVE STUDENT WHOS LUCKY NUM > 5
db.students.findOneAndDelete({lucky_number: {$gt: 5}})

# ADD NUM_OF_BELTS
db.students.updateMany(
    {},
    {$set: {num_of_belts: 0}}
)

# INCREMENT BELT FIELD BY 1 FOR STUDENTS IN WA
db.students.updateMany(
    {home_state: "WA"},
    {$inc: {num_of_belts: 1}}
)

# ADD UPDATED ON FIELD
db.students.updateMany(
    {},
    {$currentDate: {updated_on: true}}
)