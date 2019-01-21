class Article {
  num id;
  String title;
  String poster;
  String creator;
  String createDate;
  num remarkNum;

  Article(this.id, this.title, this.poster, this.creator, this.createDate,
      this.remarkNum);

  Article.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        poster = json['poster'],
        creator = json['creator']['name'],
        createDate = json['createDate'],
        remarkNum = json['remarkNum'];
}
