class HistoryModel
{
  int? id,status;
  String? search;

  HistoryModel({this.id, this.search,this.status});

  factory HistoryModel.mapToModel(Map m1)
  {
    return HistoryModel(id: m1['cid'],search: m1['history'],status: m1['status']);
  }
}