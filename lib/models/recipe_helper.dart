import 'package:cooking_app/models/recipe.dart';

class RecipeHelper {
  static List<Recipe> featuredRecipe = featuredRecipeRawData
      .map((data) => Recipe(
            title: data['title'] as String,
            photo: data['photo'] as String,
            calories: data['calories'] as String,
            time: data['time'] as String,
            description: data['description'] as String,
            reviews:
                Review.toList(data['reviews'] as List<Map<String, Object>>),
            tutorial: TutorialStep.toList(
                data['tutorial'] as List<Map<String, Object>>),
            ingridients: Ingridient.toList(
                data['ingridients'] as List<Map<String, Object>>),
          ))
      .toList();

  static List<Recipe> recommendationRecipe = recommendationRecipeRawData
      .map((data) => Recipe(
            title: data['title'] as String,
            photo: data['photo'] as String,
            calories: data['calories'] as String,
            time: data['time'] as String,
            description: data['description'] as String,
            reviews:
                Review.toList(data['reviews'] as List<Map<String, Object>>),
            tutorial: TutorialStep.toList(
                data['tutorial'] as List<Map<String, Object>>),
            ingridients: Ingridient.toList(
                data['ingridients'] as List<Map<String, Object>>),
          ))
      .toList();

  static List<Recipe> newlyPostedRecipe = newlyPostedRecipeRawData
      .map((data) => Recipe(
            title: data['title'] as String,
            photo: data['photo'] as String,
            calories: data['calories'] as String,
            time: data['time'] as String,
            description: data['description'] as String,
            reviews:
                Review.toList(data['reviews'] as List<Map<String, Object>>),
            tutorial: TutorialStep.toList(
                data['tutorial'] as List<Map<String, Object>>),
            ingridients: Ingridient.toList(
                data['ingridients'] as List<Map<String, Object>>),
          ))
      .toList();

  static List<Recipe> sweetFoodRecommendationRecipe =
      sweetFoodRecommendationRecipeRawData
          .map((data) => Recipe(
                title: data['title'] as String,
                photo: data['photo'] as String,
                calories: data['calories'] as String,
                time: data['time'] as String,
                description: data['description'] as String,
                reviews:
                    Review.toList(data['reviews'] as List<Map<String, Object>>),
                tutorial: TutorialStep.toList(
                    data['tutorial'] as List<Map<String, Object>>),
                ingridients: Ingridient.toList(
                    data['ingridients'] as List<Map<String, Object>>),
              ))
          .toList();

  static Recipe popularRecipe = Recipe(
    title: popularRecipeRawData['title'] as String,
    photo: popularRecipeRawData['photo'] as String,
    calories: popularRecipeRawData['calories'] as String,
    time: popularRecipeRawData['time'] as String,
    description: popularRecipeRawData['description'] as String,
    reviews: Review.toList(
        popularRecipeRawData['reviews'] as List<Map<String, Object>>),
    tutorial: TutorialStep.toList(
        popularRecipeRawData['tutorial'] as List<Map<String, Object>>),
    ingridients: Ingridient.toList(
        popularRecipeRawData['ingridients'] as List<Map<String, Object>>),
  );

  static List<Recipe> searchResultRecipe = recipeSearchResultRawData
      .map((data) => Recipe(
            title: data['title'] as String,
            photo: data['photo'] as String,
            calories: data['calories'] as String,
            time: data['time'] as String,
            description: data['description'] as String,
            reviews:
                Review.toList(data['reviews'] as List<Map<String, Object>>),
            tutorial: TutorialStep.toList(
                data['tutorial'] as List<Map<String, Object>>),
            ingridients: Ingridient.toList(
                data['ingridients'] as List<Map<String, Object>>),
          ))
      .toList();

  static List<Recipe> bookmarkedRecipe = bookmarkedRecipeRawData
      .map((data) => Recipe(
            title: data['title'] as String,
            photo: data['photo'] as String,
            calories: data['calories'] as String,
            time: data['time'] as String,
            description: data['description'] as String,
            reviews:
                Review.toList(data['reviews'] as List<Map<String, Object>>),
            tutorial: TutorialStep.toList(
                data['tutorial'] as List<Map<String, Object>>),
            ingridients: Ingridient.toList(
                data['ingridients'] as List<Map<String, Object>>),
          ))
      .toList();
}

var popularRecipeRawData = {
  'title': 'Canh hầm.',
  'photo': 'assets/images/mon5.jpg',
  'calories': '1500 Cal',
  'time': '25 phút',
  'description':
      'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
  'ingridients': [
    {
      'name': 'Rau chân vịt',
      'size': '250 g',
    },
    {
      'name': 'Mì',
      'size': '1000 g',
    },
    {
      'name': 'Ớt',
      'size': '50 g',
    },
    {
      'name': 'Thịt',
      'size': '1000 g',
    },
    {
      'name': 'Bông cải xanh',
      'size': '150 g',
    }
  ],
  'tutorial': [
    {
      'step': '1.Bước 1.',
      'description':
          'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    },
    {
      'step': '2. Bước 2.',
      'description':
          'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    },
    {
      'step': '3. Bước 3.',
      'description':
          'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    },
    {
      'step': '4. Bước 4.',
      'description':
          'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    },
    {
      'step': '5. Bước 5.',
      'description':
          'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    },
  ],
  'reviews': [
    {
      'username': 'Trần Linh',
      'review': 'Công thức hay, like.',
      'date': "12/12/2019"
    },
    {
      'username': 'Nhật Hà',
      'review': 'Công thức hay, like.',
      'date': "12/12/2019"
    },
    {
      'username': 'Nhật Minh',
      'review': 'Công thức hay, like.',
      'date': "12/12/2019"
    },
    {
      'username': 'Linh',
      'review': 'Công thức hay, like.',
      'date': "12/12/2019"
    },
  ]
};

var featuredRecipeRawData = [
  {
    'title': 'Thịt kho tàu.',
    'photo': 'assets/images/mon2.jpg',
    'calories': '1500 Cal',
    'time': '25 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5.B Bước 5.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {
        'username': 'Trinh Nguyễn',
        'review': 'Công thức hay',
        'date': "12/12/2019"
      },
      {'username': 'Trân', 'review': 'Công thức hay', 'date': "13/12/2019"},
      {'username': 'Trình', 'review': 'Công thức hay', 'date': "15/12/2019"},
      {'username': 'Tuấn', 'review': 'Công thức hay', 'date': "15/12/2019"},
    ]
  },
  {
    'title': 'Salad.',
    'photo': 'assets/images/heathy1.jpg',
    'calories': '870 Cal',
    'time': '32 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {
        'username': '@username',
        'review': 'Cũng không hay cho lắm! :)',
        'date': "12/10/2019"
      },
      {
        'username': '@username',
        'review': 'Cũng không hay cho lắm! :)',
        'date': "12/02/2023"
      },
    ]
  },
  {
    'title': 'Gỏi cuốn',
    'photo': 'assets/images/anh2.jpg',
    'calories': '1500 Cal',
    'time': '25 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Bước 5.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {
        'username': '@username',
        'review': 'Công thức hay.',
        'date': "12/12/2019"
      },
      {
        'username': '@username',
        'review': 'Công thức bổ ích',
        'date': "23/12/2019"
      },
      {'username': '@username', 'review': 'Bổ ích', 'date': "12/11/2023"},
      {'username': '@username', 'review': 'Tốt', 'date': "12/12/2023"},
    ]
  },
  {
    'title': 'Cuốn chả.',
    'photo': 'assets/images/mon1.jpg',
    'calories': '870 Cal',
    'time': '32 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Bước 5.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {
        'username': '@username',
        'review': 'Công thức hay.',
        'date': "12/12/2019"
      },
      {'username': '@username', 'review': 'Bổ ích', 'date': "20/12/2022"},
      {
        'username': '@username',
        'review': 'Không đúng lắm.',
        'date': "12/12/2023"
      },
    ]
  },
  {
    'title': 'Phở bò.',
    'photo': 'assets/images/mon3.jpg',
    'calories': '870 Cal',
    'time': '32 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Trứng',
        'size': '2 quả',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Giò heo',
        'size': '500 g',
      },
      {
        'name': 'Rau sống',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Khá ok.', 'date': "12/12/2019"},
      {
        'username': '@username',
        'review': 'Công thức bổ ích',
        'date': "12/12/2019"
      },
      {'username': '@username', 'review': 'Bổ ích', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Tốt', 'date': "12/12/2019"},
    ]
  }
];

var recommendationRecipeRawData = [
  {
    'title': 'Gỏi cuốn.',
    'photo': 'assets/images/mon3.jpg',
    'calories': '1500 Cal',
    'time': '25 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Bước 5.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Tạm ổn', 'date': "12/12/2019"},
      {
        'username': '@username',
        'review': 'Công thức bổ ích. Cảm ơn nhé!',
        'date': "12/12/2019"
      },
      {
        'username': '@username',
        'review': 'Chưa chuẩn vị lắm, tạm!',
        'date': "12/12/2019"
      },
      {'username': '@username', 'review': 'Tạm ổn', 'date': "12/12/2019"},
    ]
  },
  {
    'title': 'Cá kho',
    'photo': 'assets/images/monca.jpg',
    'calories': '1700 Cal',
    'time': '32 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Cá',
        'size': '500 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Hành tỏ',
        'size': '70 g',
      },
      {
        'name': 'Dứa',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Bước 5.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Công thức tệ', 'date': "12/12/2019"},
      {
        'username': '@username',
        'review': 'Không phù hợp để kho cá lắm!!!',
        'date': "12/12/2019"
      },
      {
        'username': '@username',
        'review': 'Công thức hay :).',
        'date': "12/12/2019"
      },
    ]
  },
];

var newlyPostedRecipeRawData = [
  {
    'title': 'Healthy Vege Green Egg.',
    'photo': 'assets/images/anh2.jpg',
    'calories': '1500 Cal',
    'time': '25 phút',
    'description': 'Món anh heathy nhẹ nhàng cho buổi sáng',
    'ingridients': [
      {
        'name': 'Trứng',
        'size': '1 - 2 quả',
      },
      {
        'name': 'Xà lách',
        'size': '200 g',
      },
      {
        'name': 'Cà chua',
        'size': '100 g',
      },
      {
        'name': 'Bơ',
        'size': '100 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {
        'username': '@username',
        'review': 'Heathy thực sự.',
        'date': "12/12/2019"
      },
      {'username': '@username', 'review': 'Heathy', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Heathy', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Heathy', 'date': "12/12/2019"},
    ]
  },
  {
    'title': 'Salad',
    'photo': 'assets/images/list2.jpg',
    'calories': '870 Cal',
    'time': '32 phút',
    'description': 'món ăn heathy cho bữa sáng.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Tạm ổn', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Tạm ổn', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Tạm ổn', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Tạm ổn', 'date': "12/12/2019"},
    ]
  },
  {
    'title': 'Breakfast Delimenu.',
    'photo': 'assets/images/list3.jpg',
    'calories': '870 Cal',
    'time': '32 phút',
    'description': 'Món ăn mới',
    'ingridients': [
      {'name': 'Rau chân vịt', 'size': '250 g', 'date': "12/12/2019"},
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description': 'Bước 1',
      },
      {
        'step': '2.Bước 2.',
        'description': 'Bước 2',
      },
      {
        'step': '3. Bước 3.',
        'description': 'Bước 3',
      },
      {
        'step': '4. Bước 4.',
        'description': 'Bước 4',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description': 'Bước 5',
      },
    ],
    'reviews': [
      {'username': 'Nguyen hoa', 'review': 'Tạm ổn', 'date': "12/12/2019"},
      {'username': 'Minh Hà', 'review': 'Tạm ổn', 'date': "12/02/2020"},
      {'username': 'Minh Hải', 'review': 'Tạm ổn', 'date': "12/11/2023"},
      {'username': 'Lê Thị Ngọc', 'review': 'Tạm ổn', 'date': "12/12/2023"},
    ]
  },
  {
    'title': 'Basil Leaves & Avocado Bread.',
    'photo': 'assets/images/list4.jpg',
    'calories': '1200 Cal',
    'time': '40 phút',
    'description': 'Món ăn phù hợp cho hôm nay.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {
        'username': 'Nguyễn Lân',
        'review': 'Công thức bổ ích',
        'date': '12/12/2019'
      },
    ]
  },
  {
    'title': 'Healthy Beef & Egg.',
    'photo': 'assets/images/list5.jpg',
    'calories': '1100 Cal',
    'time': '30 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Có ích.', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Có ích.', 'date': "12/12/2019"},
    ]
  },
  {
    'title': 'Meats and Vegetables Bowl.',
    'photo': 'assets/images/banhcanh.jpg',
    'calories': '1450 Cal',
    'time': '120 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {
        'username': '@username',
        'review':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
        'date': "12/12/2019"
      },
    ]
  },
  {
    'title': 'Pancake with Honey.',
    'photo': 'assets/images/canhham.jpg',
    'calories': '1500 Cal',
    'time': '25 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {
        'username': '@username',
        'review': 'Nấu xong cảm giác không ngon!',
        'date': "12/12/2023"
      },
      {
        'username': '@username',
        'review': 'Nấu xong cảm giác không ngon!',
        'date': "12/12/2023"
      },
    ]
  },
  {
    'title': 'Chocolate Pancake.',
    'photo': 'assets/images/anh2.jpg',
    'calories': '870 Cal',
    'time': '32 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': 'Nguyen hoa', 'review': 'Tạm ổn', 'date': "12/12/2019"},
      {'username': 'Minh Hà', 'review': 'Tạm ổn', 'date': "12/02/2020"},
      {'username': 'Minh Hải', 'review': 'Tạm ổn', 'date': "12/11/2023"},
      {'username': 'Lê Thị Ngọc', 'review': 'Tạm ổn', 'date': "12/12/2023"},
    ]
  },
];

var sweetFoodRecommendationRecipeRawData = [
  {
    'title': 'Pancake with Honey.',
    'photo': 'assets/images/canhham.jpg',
    'calories': '1500 Cal',
    'time': '25 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': 'Nguyen hoa', 'review': 'Tạm ổn', 'date': "12/12/2019"},
      {'username': 'Minh Hà', 'review': 'Tạm ổn', 'date': "12/02/2020"},
      {'username': 'Minh Hải', 'review': 'Tạm ổn', 'date': "12/11/2023"},
      {'username': 'Lê Thị Ngọc', 'review': 'Tạm ổn', 'date': "12/12/2023"},
      {'username': 'Nguyen hoa', 'review': 'Tạm ổn', 'date': "12/12/2019"},
      {'username': 'Minh Hà', 'review': 'Tạm ổn', 'date': "12/02/2020"},
      {'username': 'Minh Hải', 'review': 'Tạm ổn', 'date': "12/11/2023"},
      {'username': 'Lê Thị Ngọc', 'review': 'Tạm ổn', 'date': "12/12/2023"},
    ]
  },
  {
    'title': 'Chocolate Pancake.',
    'photo': 'assets/images/sweetfood2.jpg',
    'calories': '870 Cal',
    'time': '32 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': 'Nguyen hoa', 'review': 'Tạm ổn', 'date': "12/12/2019"},
      {'username': 'Minh Hà', 'review': 'Tạm ổn', 'date': "12/02/2020"},
      {'username': 'Minh Hải', 'review': 'Tạm ổn', 'date': "12/11/2023"},
      {'username': 'Lê Thị Ngọc', 'review': 'Tạm ổn', 'date': "12/12/2023"},
    ]
  },
];

var popularRecipeKeyword = [
  'Mì',
  'Bakso',
  'Kwetiaw',
  'Nasi Goreng',
  'Spaghetti',
  'Rujak',
  'Chicken',
  'Nugget',
  'Ice Cream',
  'Bakmi'
];

var recipeSearchResultRawData = [
  {
    'title': 'Healthy Vege Green Egg.',
    'photo': 'assets/images/list1.jpg',
    'calories': '1500 Cal',
    'time': '25 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {
        'username': '@username',
        'review':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
        'date': "12/12/2019"
      },
    ]
  },
  {
    'title': 'Delicious Salad by Ron.',
    'photo': 'assets/images/list2.jpg',
    'calories': '870 Cal',
    'time': '32 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {
        'username': '@username',
        'review': 'Cảm ơn vì đã chia sẻ công thức!',
        'date': "12/12/2019"
      },
      {'username': '@username', 'review': 'Cảm ơn!', 'date': "12/12/2019"},
    ]
  },
  {
    'title': 'Basil Leaves & Avocado Bread.',
    'photo': 'assets/images/list4.jpg',
    'calories': '1200 Cal',
    'time': '40 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2020"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2021"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2022"},
    ]
  },
  {
    'title': 'Healthy Beef & Egg.',
    'photo': 'assets/images/list5.jpg',
    'calories': '1100 Cal',
    'time': '30 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2020"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2021"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2022"},
    ]
  },
  {
    'title': 'Meats and Vegetables Bowl.',
    'photo': 'assets/images/list6.jpg',
    'calories': '1450 Cal',
    'time': '120 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2020"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2021"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2022"},
    ]
  },
  {
    'title': 'Breakfast Delimenu.',
    'photo': 'assets/images/list3.jpg',
    'calories': '870 Cal',
    'time': '32 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2020"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2021"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2022"},
    ]
  },
];

var bookmarkedRecipeRawData = [
  {
    'title': 'Healthy Vege Green Egg.',
    'photo': 'assets/images/list1.jpg',
    'calories': '1500 Cal',
    'time': '25 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2020"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2021"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2022"},
    ]
  },
  {
    'title': 'Delicious Salad by Ron.',
    'photo': 'assets/images/list2.jpg',
    'calories': '870 Cal',
    'time': '32 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2020"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2021"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2022"},
    ]
  },
  {
    'title': 'Basil Leaves & Avocado Bread.',
    'photo': 'assets/images/list4.jpg',
    'calories': '1200 Cal',
    'time': '40 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2020"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2021"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2022"},
    ]
  },
  {
    'title': 'Healthy Beef & Egg.',
    'photo': 'assets/images/list5.jpg',
    'calories': '1100 Cal',
    'time': '30 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2020"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2021"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2022"},
    ]
  },
  {
    'title': 'Meats and Vegetables Bowl.',
    'photo': 'assets/images/list6.jpg',
    'calories': '1450 Cal',
    'time': '120 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2020"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2021"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2022"},
    ]
  },
  {
    'title': 'Breakfast Delimenu.',
    'photo': 'assets/images/list3.jpg',
    'calories': '870 Cal',
    'time': '32 phút',
    'description':
        'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
    'ingridients': [
      {
        'name': 'Rau chân vịt',
        'size': '250 g',
      },
      {
        'name': 'Mì',
        'size': '1000 g',
      },
      {
        'name': 'Ớt',
        'size': '50 g',
      },
      {
        'name': 'Thịt',
        'size': '1000 g',
      },
      {
        'name': 'Bông cải xanh',
        'size': '150 g',
      }
    ],
    'tutorial': [
      {
        'step': '1. Bước 1.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '2.Bước 2.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '3. Bước 3.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '4. Bước 4.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
      {
        'step': '5. Buang semua isi piring.',
        'description':
            'Gỏi cuốn tôm thịt là món ngon hấp dẫn, có độ dinh dưỡng cao và thích hợp cho những ngày mà bạn cảm thấy ngán cơm, thì đây là sự lựa chọn hoàn hảo.',
      },
    ],
    'reviews': [
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2019"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2020"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2021"},
      {'username': '@username', 'review': 'Bổ ích.', 'date': "12/12/2022"},
    ]
  },
];
