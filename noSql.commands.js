db.createCollection("users");
db.createCollection("sales_people");
db.createCollection("admins");
db.createCollection("customers");
db.createCollection("categories");
db.createCollection("products");
db.createCollection("orders");
db.createCollection("orders_products");

//TO EXECUTE THE RELATIONSHIP BETEWEEN THE ENTITIES(COLLECTIONS).

db.admin.aggregate([
  {
    $lookup: {
      from: "users",
      localField: "_id",
      foreignField: "users_id",
      as: "user",
    },
  },
]);

// TO INSERT RECORDS INTO ENTITIES(COLLECTIONS)
db.users.insertMany([
  {
    username: "sulaimon123",
    password: "ras24",
    email: "maito4me@gmail.com",
    phone_number: "08977699389",
    address: "88, adekunle street, lawanson, Lagos, Nigeria",
    gender: "male",
  },
  {
    username: "stephen88",
    password: "osun67",
    email: "loree@gmail.com",
    phone_number: "09065432113",
    address: "100, ademola street, egbado, Lagos, Lagos, Nigeria",
    gender: "male",
  },
  {
    username: "lawal123",
    password: "las24",
    email: "maito4me@gmail.com",
    phone_number: "08155696389",
    address: "66, benson street, Alakuko, Lagos, Nigeria",
    gender: "male",
  },
  {
    username: "gand88",
    password: "rus67",
    email: "loree@gmail.com",
    phone_number: "09065432113",
    address: "100, kawaye street, crossing, Lagos, Nigeria",
    gender: "male",
  },
]);

db.customers.insertMany([
  {
    firstName: "Sulaimon",
    lastName: "Taiwo",
    city: "Lagos",
    postal_code: "00001",
    region: "Alakuko",
    country: "Nigeria",
  },
  {
    firstName: "Stephen",
    lastName: "Banire",
    city: "Ogun",
    postal_code: "00002",
    region: "Ipaja",
    country: "Nigeria",
  },
]);

db.admins.insertMany([
  { firstName: "dare", lastName: "debowale" },
  { firstName: "chukwu", lastName: "chinoze" },
]);

db.sales_people.insertMany([
  { firstName: "kunle", lastName: "abolarin" },
  { firstName: "Lookman", lastName: "williams" },
]);

db.categories.insertMany([
  {
    name: "drinks",
    description: "This is made up of different type of soft drinks",
  },
  {
    name: "electronics",
    description: "This contains several electrical gadget",
  },
]);

db.orders.insertMany([
  {
    shipAddress: "abolarin",
    shipCity: "ipaja",
    shipAddress: "75 Adegbola street",
    shipPostalCode: "9908884",
    shipCountry: "Nigeria",
    uniteOnOrder: "2",
  },
  {
    shipAddress: "55, fatai road",
    shipCity: "Alakuko",
    shipAddress: "75 Adegbola street",
    shipPostalCode: "000987",
    shipCountry: "Nigeria",
    uniteOnOrder: "3",
  },
]);

db.products.insertMany([
  {
    name: "abolarin",
    spice: "ipaja",
    quantityInAunit: "",
    size: "9908884",
    scolor: "Nigeria",
    description: "2",
  },
  {
    shipAddress: "55, fatai road",
    shipCity: "Alakuko",
    shipAddress: "75 Adegbola street",
    shipPostalCode: "000987",
    shipCountry: "Nigeria",
    uniteOnOrder: "3",
  },
])


//TO EXECUTE THE RELATIONSHIP BETEWEEN THE ENTITIES(COLLECTIONS).

//FOR ADMINS
db.admins.aggregate([
  {
    $lookup: {
      from: "users",
      localField: "_id",
      foreignField: "users_id",
      as: "user",
    },
  },
]);

//FOR CUSTOMERS
db.customers.aggregate([
  {
    $lookup: {
      from: "users",
      localField: "_id",
      foreignField: "users_id",
      as: "user",
    },
  },
]);

//FOR SALES_PEOPLE
db.sales_people.aggregate([
  {
    $lookup: {
      from: "users",
      localField: "_id",
      foreignField: "users_id",
      as: "user",
    },
  },
]);

//FOR ORDERS
db.orders.aggregate([
  {
    $lookup: {
      from: "customers",
      localField: "_id",
      foreignField: "customers_id",
      as: "customer",
    },
  },
  {
    $lookup: {
      from: "sales_people",
      localField: "_id",
      foreignField: "sales_people_id",
      as: "sales_person",
    },
  },
]);

//FOR PRODUCTS
db.products.aggregate([
  {
    $lookup: {
      from: "sales_people",
      localField: "_id",
      foreignField: "sales_people_id",
      as: "sales_person",
    },
  },
  {
    $lookup: {
      from: "categories",
      localField: "_id",
      foreignField: "categories_id",
      as: "category",
    },
  },
]);

db.orders_products.aggregate([
  {
    $lookup: {
      from: "orders",
      localField: "_id",
      foreignField: "orders_id",
      as: "order",
    },
  },
  {
    $lookup: {
      from: "products",
      localField: "_id",
      foreignField: "products_id",
      as: "product",
    },
  },
]);

// TO GET RECORDS FROM THE ENTITIES

db.products.find()

db.categories.findOne({_id:""})

// TO UPDATE RECORDS FROM THE ENTITIES

db.users.update({_id:""}, {$set:{address:""}})

db.customers.update({_id:""}, {$set:{firstName:""}})

// TO DELETE RECORDS FROM THE ENTITIES

db.products.deleteOne({_id:""})

db.orders.deleteOne({_id:""})


