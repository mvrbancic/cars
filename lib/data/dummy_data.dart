import 'package:flutter/material.dart';

import '../models/car.dart';
import '../models/category.dart';

var carCategories = [
  const Category(
    id: 'toyota',
    title: 'Toyota',
    color: Colors.red,
  ),
  const Category(
    id: 'volkswagen',
    title: 'Volkswagen',
    color: Colors.blue,
  ),
  const Category(
    id: 'bmw',
    title: 'BMW',
    color: Colors.grey,
  ),
  const Category(
    id: 'mercedes',
    title: 'Mercedes-Benz',
    color: Colors.black,
  ),
  const Category(
    id: 'honda',
    title: 'Honda',
    color: Colors.indigo,
  ),
  Category(
    id: 'ford',
    title: 'Ford',
    color: Colors.blue[900]!,
  ),
  Category(
    id: 'tesla',
    title: 'Tesla',
    color: Colors.red[700]!,
  ),
  Category(
    id: 'hyundai',
    title: 'Hyundai',
    color: Colors.blue[300]!,
  ),
];
final List<Car> dummyCars = [
  Car(
    id: 'c1',
    categories: ['toyota', 'Sedan', 'Family'],
    make: 'toyota',
    model: 'Camry',
    year: 2023,
    color: 'Silver',
    price: 25000,
    image: 'https://images.unsplash.com/photo-1621007947382-bb3c3994e3fb',
    features: [
      'Hybrid Engine',
      'Advanced Safety Features',
      'Spacious Interior',
      'Bluetooth Connectivity'
    ],
    comments: [
      'A reliable car for daily commuting and long trips.',
      'The fuel efficiency is excellent, and the hybrid engine saves a lot on gas.',
      'Comfortable seats and spacious cabin make it perfect for families.',
      'Smooth driving experience, even on highways.'
    ],
  ),
  Car(
    id: 'c2',
    categories: ['toyota', 'SUV', 'Family'],
    make: 'toyota',
    model: 'RAV4',
    year: 2022,
    color: 'White',
    price: 27000,
    image: 'https://images.unsplash.com/photo-1633506098996-3953da035801',
    features: [
      'All-Wheel Drive',
      'Fuel Efficient',
      'Large Cargo Space',
      'Touchscreen Display'
    ],
    comments: [
      'Perfect for family road trips and outdoor adventures.',
      'The cargo space is impressive—it fits everything we need.',
      'The touchscreen infotainment system is user-friendly.',
      'Handles well on both city streets and rough terrain.'
    ],
  ),
  Car(
    id: 'c3',
    categories: ['toyota', 'Sedan', 'Compact'],
    make: 'toyota',
    model: 'Corolla',
    year: 2024,
    color: 'Black',
    price: 22000,
    image: 'https://images.unsplash.com/photo-1623869675781-80aa31012a5a',
    features: [
      'Reliable Performance',
      'High Resale Value',
      'Modern Design',
      'Apple CarPlay/Android Auto'
    ],
    comments: [
      'A budget-friendly car with modern features.',
      'Compact yet roomy enough for a small family.',
      'The resale value is among the best in its class.',
      'Apple CarPlay works seamlessly—very convenient!'
    ],
  ),
  Car(
    id: 'c4',
    categories: ['volkswagen', 'Hatchback', 'Compact'],
    make: 'volkswagen',
    model: 'Golf',
    year: 2023,
    color: 'Blue',
    price: 23000,
    image: 'https://images.unsplash.com/photo-1617814076367-b759c7d7e738',
    features: [
      'Turbocharged Engine',
      'Premium Audio System',
      'Sporty Handling',
      'LED Headlights'
    ],
    comments: [
      'A fun car to drive, especially with the turbo engine.',
      'Handles corners like a dream—very sporty.',
      'The audio system is top-notch for music lovers.',
      'Stylish design, and the blue color looks amazing.'
    ],
  ),
  Car(
    id: 'c5',
    categories: ['volkswagen', 'SUV', 'Luxury'],
    make: 'volkswagen',
    model: 'Tiguan',
    year: 2022,
    color: 'Gray',
    price: 30000,
    image: 'https://images.unsplash.com/photo-1632245889029-e406faaa34cd',
    features: [
      'Panoramic Sunroof',
      'All-Wheel Drive',
      'Smartphone Integration',
      'Heated Seats'
    ],
    comments: [
      'The panoramic sunroof is a game-changer—feels very premium.',
      'Great for long drives, especially with the comfortable seats.',
      'The smartphone integration works flawlessly.',
      'Spacious and luxurious—a great value for the price.'
    ],
  ),
  Car(
    id: 'c6',
    categories: ['bmw', 'SUV', 'Luxury'],
    make: 'bmw',
    model: 'X5',
    year: 2024,
    color: 'Black',
    price: 60000,
    image: 'https://images.unsplash.com/photo-1555215695-3004980ad54e',
    features: [
      'Luxury Interior',
      'Advanced Safety Features',
      'High Performance',
      'Wireless Charging'
    ],
    comments: [
      'An absolute beast in terms of performance and luxury.',
      'The safety features give me peace of mind during every drive.',
      'Interior feels very high-end—worth the price tag.',
      'The wireless charging pad is a handy addition.'
    ],
  ),
  Car(
    id: 'c7',
    categories: ['bmw', 'Sedan', 'Luxury'],
    make: 'bmw',
    model: '330i',
    year: 2023,
    color: 'White',
    price: 42000,
    image: 'https://images.unsplash.com/photo-1616455579100-2ceaa4eb2d37',
    features: [
      'Sport Mode',
      'Rear-Wheel Drive',
      'Sunroof',
      'Premium Leather Seats'
    ],
    comments: [
      'Sporty and luxurious—the perfect mix.',
      'The rear-wheel drive makes for an engaging driving experience.',
      'The leather seats feel very premium and are super comfortable.',
      'A head-turner on the road, especially in white.',
      'Sporty and luxurious—the perfect mix.',
      'The rear-wheel drive makes for an engaging driving experience.',
      'The leather seats feel very premium and are super comfortable. A head-turner on the road, especially in white.',
      'A head-turner on the road, especially in white.'
    ],
  ),
  Car(
    id: 'c8',
    categories: ['mercedes', 'Sedan', 'Luxury'],
    make: 'mercedes',
    model: 'C-Class',
    year: 2023,
    color: 'Silver',
    price: 45000,
    image: 'https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8',
    features: [
      'Adaptive Cruise Control',
      'Ambient Lighting',
      'Dynamic Driving Modes',
      'Wireless Apple CarPlay'
    ],
    comments: [
      'The ambient lighting is a beautiful touch—feels futuristic.',
      'Driving modes make it easy to switch between comfort and sport.',
      'A luxurious car that offers amazing tech features.',
      'Smooth and quiet ride—perfect for long commutes.'
    ],
  ),
];

