import 'package:flutter/material.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://img.freepik.com/premium-photo/captivating-cartoon-characters-cute-kids-playful-boys-lovely-girls-digital-world_1142283-14301.jpg"),
            ),
            contentPadding: EdgeInsets.all(0),
            title: Text("Ram Karki"),
            subtitle: Text(
              "24 sep 2023",
              style: TextStyle(fontSize: 12),
            ),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ),
          Text("This is so funny"),
          SizedBox(
            height: 2,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://preview.redd.it/what-the-v0-2bke5nw8ynma1.jpg?auto=webp&s=987be617161668640b7534364c52514a4b271702"),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                  ),
                  Text("4 likes")
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.bookmark_border_rounded),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
