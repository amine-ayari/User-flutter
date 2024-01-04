import 'package:flutter/material.dart';
import 'package:flutter_dashboard/pages/home/Profile_page.dart';
//import 'package:flutter_dashboard/pages/home/widgets/list_user.dart';
import 'package:flutter_dashboard/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Future<String?> getSession(String token) async { //
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(token);  //
}
class _HomePageState extends State<HomePage> {
  bool isExpanded = false;
  AuthService authService = AuthService();

 void logout(BuildContext context) async {
  
  try {
    // Get the user's token from wherever it's stored in your app
    String? token = await getSession('token'); // Replace with your actual token retrieval logic

    // Check if the user is logged in (token is available)
    if (token != null) {
      // Call the API to logout
      await authService.logoutUser(token);

      // Clear the user session/token (this is a placeholder, replace with your actual logic)
      // AuthService().clearSession(); // Uncomment and implement if you have such a method

      // Navigate to the login page
      Navigator.pushReplacementNamed(context, '/login'); // Replace '/login' with your actual login route
      
    } else {
      // User is not logged in, handle accordingly (e.g., show an error message)
      print('User not logged in');
      // You might want to show a snackbar or dialog with an error message
    }
  } catch (error) {
    // Handle errors during logout
    print('Logout failed: $error');
    if (error is Exception) {
      print('Error during logout: $error');
    }
  }
}


  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // key: widget.scaffoldKey,
      appBar: AppBar(
        title: Text("Velou"),
        actions: [
          IconButton(
            onPressed: toggleExpanded,
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
             ListTile(
  leading: Icon(Icons.home), // Add the icon here
  title: Text('Home'),
  onTap: () {
    Navigator.of(context).pushReplacementNamed('/profile');
  },
),
 
            // Add your sidebar/menu items here
ListTile(
  leading: Icon(Icons.person),
  title: Text('Profile'),
  onTap: () async {
    try {
     /* AuthService authService = AuthService();
      // Fetch the list of users
      List<Map<String, dynamic>> users = await authService.getAllUsers();*/

      // Navigate to the profile page and pass the fetched users
    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserListPage(),
                          ),
                        );
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error fetching users: $error');
    }
  },
),
            ListTile(
  leading: Icon(Icons.directions_bike), // Add the icon here
  title: Text('Bike'),
  onTap: () {
    Navigator.of(context).pushReplacementNamed('/velo');
  },
),
          ListTile(
  title: Row(
    children: [
      Icon(Icons.payment), // Add the payment icon here
      SizedBox(width: 8), // Adjust the spacing between icons and text
      Icon(Icons.calendar_today), // Add the reservation icon here
      SizedBox(width: 8), // Adjust the spacing between icons and text
      Text('Payment/Reservation'),
    ],
  ),
  onTap: () {
    Navigator.of(context).pushReplacementNamed('/velo');
  },
),
ListTile(
  leading: Icon(Icons.post_add), // Add the post icon here
  title: Text('Post'),
  onTap: () {
    Navigator.of(context).pushReplacementNamed('/velo');
  },
),
ListTile(
  leading: Icon(Icons.description), // Add the description icon here
  title: Text('Claims'),
  onTap: () {
    Navigator.of(context).pushReplacementNamed('/velo');
  },
),
IconButton(
            onPressed: () => logout(context),
            icon: Icon(Icons.logout),
          ),



            // Add more items as needed
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(60.0),
              child: SingleChildScrollView(
                // Your existing content here
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: toggleExpanded,
                          icon: Icon(Icons.menu),
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://mighty.tools/mockmind-api/content/human/49.jpg"),
                          radius: 26.0,
                        ),

                        
                  ],
                ),
                SizedBox(
                  height:20.0,
                ),
                Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        child: Card(
                           child: Padding(
                        padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.article, 
                        size: 26.0, 
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text("Claims",
                        style: TextStyle(
                          fontSize: 26.0, 
                        fontWeight: FontWeight.bold,
                         ) ,
                         )
                        ],
                        ),
                        SizedBox(height: 20.0,),
                        Text("All Claims", style: TextStyle(
                          fontSize: 36, fontWeight: FontWeight.bold,
                        ),
                        )
                        ],
                      ),
                            ),
                    ),
                    ),
Flexible(
                        child: Card(
                           child: Padding(
                        padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.hourglass_empty_rounded, 
                        size: 26.0, 
                        color: Colors.red,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text("Non Treated",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 26.0, 
                        fontWeight: FontWeight.bold,
                         ) ,
                         )
                        ],
                        ),
                        SizedBox(height: 20.0,),
                        Text("+50 Waiting", style: TextStyle(
                          color: Colors.red,
                          fontSize: 36, fontWeight: FontWeight.bold,
                        ),
                        )
                        ],
                      ),
                           ),
                    ),
                    ),
Flexible(
                        child: Card(
                           child: Padding(
                        padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.drafts, 
                        size: 26.0, 
                        color: Colors.amber,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(" In Progress",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 26.0, 
                        fontWeight: FontWeight.bold,
                         ) ,
                         )
                        ],
                        ),
                        SizedBox(height: 20.0,),
                        Text("2 Drafts", style: TextStyle(
                          color: Colors.amber,
                          fontSize: 34, fontWeight: FontWeight.bold,
                        ),
                        )
                        ],
                      ),
                           ),
                    ),
                    ),
Flexible(
                        child: Card(
                           child: Padding(
                        padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.done, 
                        size: 26.0, 
                        color: Colors.green,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text("Treated",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 26.0, 
                        fontWeight: FontWeight.bold,
                         ) ,
                         )
                        ],
                        ),
                        SizedBox(height: 20.0,),
                        Text("+34 Claims", style: TextStyle(
                          color: Colors.green,
                          fontSize: 36, fontWeight: FontWeight.bold,
                        ),
                        )
                        ],
                      ),
                           ),
                    ),
                    ),




                  ],
                  ),
SizedBox(height: 30.0,),



Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(
      children: [
        Text(
          "17 Claims", 
          style: TextStyle(
            fontWeight: FontWeight.bold,
fontSize: 28.0,
),
),
SizedBox(height: 10.0,),
Text("3 new Claims", style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.w400),)

],
),
Container(
  width: 300.0,
  child: TextField(
  decoration: InputDecoration(
    hintText: "Type Claim Title",
    prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black26,
),
),
),
 ),
)
],
),
SizedBox(
  height: 40.0,
),
                
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    TextButton.icon(
      onPressed: (){}, 
      icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 172, 216, 122),), 
      label: Text("2023, July 14, July 15, July16", style: TextStyle(color: Colors.greenAccent.shade200,
      ),
      ),
      ),
      Row(
        children: [
        DropdownButton(
          hint: Text("Filter by"),
          items: [
          DropdownMenuItem(
            value: "Date",
            child: Text("Date"),
      ),
      DropdownMenuItem(
        value: "Title",
            child: Text("Title"),
      ),
      DropdownMenuItem(
        value: "State",
            child: Text("State"),
      ),
      ], onChanged: (value) {}),
      SizedBox(width: 20.0,),
      DropdownButton(
          hint: Text("Order by"),
          items: [
          DropdownMenuItem(
            value: "Date",
            child: Text("Date"),
      ),
      DropdownMenuItem(
        value: "Title",
            child: Text("Title"),
      ),
      DropdownMenuItem(
        value: "State",
            child: Text("State"),
      ),
      ], onChanged: (value) {}),
      ],
      ),
      ],
      ),
      SizedBox(
        height: 40.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DataTable( 
          headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.grey.shade200),
          columns: [
          DataColumn(label: Text("ID")),
              DataColumn(label: Text("Claim Title")),
                  DataColumn(label: Text("Date")),
                      DataColumn(label: Text("State")),
                          DataColumn(label: Text("Action")),
      ], 
      
      rows: [
        DataRow(cells:
         [DataCell(Text("0",style: TextStyle(
                          color: Colors.green),),),
        DataCell(Text("The price is high",style: TextStyle(
                          color: Colors.green),),),
        DataCell(Text("${DateTime.now()}",style: TextStyle(
                          color: Colors.green),),),
        DataCell(Text("Treated",style: TextStyle(
                          color: Colors.green),),),
        DataCell(Row(
  children: [
    Icon(Icons.read_more),
    Icon(Icons.forward),
    Icon(Icons.delete),
  ],
),),

      ]),
         DataRow(cells:
         [DataCell(Text("1",style: TextStyle(
                          color: Colors.amber),),),
        DataCell(Text("The bicycle is not the same as in the pictures",style: TextStyle(
                          color: Colors.amber),),),
        DataCell(Text("${DateTime.now()}",style: TextStyle(
                          color: Colors.amber),),),
        DataCell(Text("In progress",style: TextStyle(
                          color: Colors.amber),),),
        DataCell(Row(
  children: [
    Icon(Icons.read_more),
    Icon(Icons.forward),
    Icon(Icons.delete),
  ],
),),

      ]),
         DataRow(cells:
         [DataCell(Text("2")),
        DataCell(Text("The account is fake")),
        DataCell(Text("${DateTime.now()}")),
        DataCell(Text("Draft")),
        DataCell(Row(
  children: [
    Icon(Icons.read_more),
    Icon(Icons.forward),
    Icon(Icons.delete),
  ],
),),

      ]),
         DataRow(cells:
         [DataCell(Text("3",style: TextStyle(
                          color: Colors.red),),),
        DataCell(Text("The price is high",style: TextStyle(
                          color: Colors.red),),),
        DataCell(Text("${DateTime.now()}",style: TextStyle(
                          color: Colors.red),),),
        DataCell(Text("New",style: TextStyle(
                          color: Colors.red),),),
        DataCell(Row(
  children: [
    Icon(Icons.read_more),
    Icon(Icons.forward),
    Icon(Icons.delete),
  ],
),),

      ]),
        DataRow(cells:
         [DataCell(Text("4",style: TextStyle(
                          color: Colors.red),),),
        DataCell(Text("The time is passed",style: TextStyle(
                          color: Colors.red),),),
        DataCell(Text("${DateTime.now()}",style: TextStyle(
                          color: Colors.red),),),
        DataCell(Text("New",style: TextStyle(
                          color: Colors.red),),),
        DataCell(Row(
  children: [
    Icon(Icons.read_more),
    Icon(Icons.forward),
    Icon(Icons.delete),
  ],
),),
         ]),
      ]),
      SizedBox(height: 40.0,
      ),
      Row(
        children: [
          TextButton(onPressed: () {}, child: Text("1", style: TextStyle(color: Colors.deepPurple),
          ),
          ),
          TextButton(onPressed: () {}, child: Text("2", style: TextStyle(color: Colors.deepPurple),
          ),
          ),
          TextButton(onPressed: () {}, child: Text("3", style: TextStyle(color: Colors.deepPurple),
          ),
          ),
          TextButton(onPressed: () {}, child: Text("See All", style: TextStyle(color: Colors.deepPurple),
          ),
          ),
        ],
        )
      ],
        )
        ], 
            ),
            ),
          ),
          ),
        ],
      ),


      

    );
  }
}


class BikeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bike"),
      ),
      body: Center(
        child: Text("This is the Bike Widget"),
      ),
    );
  }
}
