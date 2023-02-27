class Category {
  String name;
  String image;

  Category(this.name, this.image);
}

List<Category> reCategory =
    CategoryData.map((item) => Category(item['name']!, item['image']!))
        .toList();

var CategoryData = [
  {
    "name": "Manali",
    "image":
        "https://t4.ftcdn.net/jpg/01/71/19/19/360_F_171191968_h1yWvnUTa0MM6iIBnGdAHZeUAJEh9dBh.jpg"
  },
  {
    "name": "Shimla",
    "image":
        "https://media.istockphoto.com/id/1223612773/photo/the-kalka-to-shimla-railway-is-a-2-ft-6-in-narrow-gauge-railway-in-north-india-which.jpg?s=612x612&w=0&k=20&c=vYxFBTbvcLcivcYjtFB-S_P7ETUwgIj0mAk84l9uC1g="
  },
  {
    "name": "Mussorie",
    "image":
        "https://media.istockphoto.com/id/1140128164/photo/mussoorie-landscape-in-cloudy-rainy-monsoon-season-stock-image.jpg?s=612x612&w=0&k=20&c=j-S1rhG75D8YNwidXt_Wt3KdqWjLxeJBFViPnCcUsZ0="
  }
];
