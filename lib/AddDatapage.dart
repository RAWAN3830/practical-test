class AddData{
  final String? stu_name;
  final String? stu_grid;
  final String? stu_standard;
  final String? stu_image;

  AddData(
  {
    required this.stu_name,
    required this.stu_grid,
    required this.stu_standard,
    required this.stu_image
  });
}

List<AddData> addData = [
  AddData(stu_name:'ved', stu_grid: '1234', stu_standard: '23', stu_image: 'assets/images/s1.jpg'),
  AddData(stu_name:'hanuman', stu_grid: '124', stu_standard: '8', stu_image: 'assets/images/s2.jpg')

];

class Temp{
  final String? stu_name;
  final String? stu_grid;
  final String? stu_standard;
  final String? stu_image;

  Temp(
      {
        required this.stu_name,
        required this.stu_grid,
        required this.stu_standard,
        required this.stu_image
      });
}

List<Temp> temp = [
  
];