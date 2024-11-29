import 'package:flutter/material.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionPage> {
  String selectedPlan = '1 месяц';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: -10,
            left: -10,
            child: Image.asset(
              'assets/images/left.png',
              width: 250,
              height: 500,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: -10,
            right: -40,
            child: Image.asset(
              'assets/images/right.png',
              width: 350,
              height: 600,
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios,
                          color: Colors.white, size: 28),
                      onPressed: () {},
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Заголовок
                  const Text(
                    'Выберите подписку',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPlan = '1 месяц';
                      });
                    },
                    child: SubscriptionCard(
                      height: 150,
                      title: '1 месяц',
                      price: '1000р',
                      description: 'Описание',
                      isSelected: selectedPlan == '1 месяц',
                      benefits: [],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPlan = '6 месяцев';
                      });
                    },
                    child: SubscriptionCard(
                      title: '6 месяцев',
                      price: '10 000р',
                      oldPrice: '12 000р',
                      description: 'Описание',
                      isSelected: selectedPlan == '6 месяцев',
                      benefits: const [
                        'что входит',
                        'что входит',
                        'что входит',
                        'что входит',
                        'что входит',
                      ],
                    ),
                  ),
                  const Spacer(),

                  // Кнопка покупки
                  ElevatedButton(
                    onPressed: () {
                      print('Выбранный план: $selectedPlan');
                      // Действия по покупке можно добавить здесь
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff6B66D8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 80,
                      ),
                    ),
                    child: const Text(
                      'Купить',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'terms of use',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'policy privacy',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Restore purchase',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String price;
  final String? oldPrice;
  final String description;
  final bool isSelected;
  final List<String> benefits;
  final double? height;

  const SubscriptionCard({
    required this.title,
    required this.price,
    this.oldPrice,
    required this.description,
    required this.isSelected,
    required this.benefits,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: height ?? 250,
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.black87.withOpacity(0.4)
            : Colors.black54.withOpacity(0.7),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: isSelected ? const Color(0xff6B66D8) : Colors.transparent,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (isSelected)
                const Icon(
                  Icons.check_circle,
                  color: Color(0xff6B66D8),
                  size: 24,
                ),
              if (isSelected) const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (oldPrice != null)
                    Text(
                      oldPrice!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          if (benefits.isNotEmpty) ...[
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: benefits
                  .map(
                    (benefit) => Row(
                      children: [
                        const Icon(Icons.check,
                            color: Color(0xff6B66D8), size: 16),
                        const SizedBox(width: 8),
                        Text(
                          benefit,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}
