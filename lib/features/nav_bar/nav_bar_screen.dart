import 'package:assignment/features/account/account_screen.dart';
import 'package:assignment/features/category/presentation/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../main.dart';
import '../../utils/images.dart';
import '../home/presentation/home_screen.dart';
import '../shopping/presentation/shopping_screen.dart';
import 'logic/navbar_cubit.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  DateTime? _lastBackPressTime;
  List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    ShoppingScreen(),
    AccountScreen(),


  ];


  @override
  void initState() {
    super.initState();

  }


  Future<bool> _onWillPop(int currentIndex) async {
    DateTime now = DateTime.now();
    if (currentIndex != 0) {
      Get.context!.read<NavbarCubit>().setIndex(0);
      return false; // Don't exit the app
    }

    // If already at index 0, show exit warning
    if (_lastBackPressTime == null || now.difference(_lastBackPressTime!) > const Duration(seconds: 2)) {
      _lastBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(  "Press back again to exit"),
          duration: Duration(seconds: 2),
        ),
      );
      return false; // Don't exit immediately
    }
    return true; // Exit the app
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, NavbarState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: (){
            return _onWillPop(state.index);
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            key: _scaffoldKey,

            body: IndexedStack(
              index: state.index,
              children: _screens,
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    spreadRadius: 2, // Spread of shadow
                    blurRadius: 8, // Blur effect
                    offset: const Offset(0, -3), // Moves shadow upwards
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: state.index,
                onTap: (index){
                  Get.context!.read<NavbarCubit>().setIndex(index);
                },
                selectedLabelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w600),
                unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w500),
                backgroundColor: Colors.white,
                selectedItemColor:Theme.of(context).primaryColor,
                unselectedItemColor: Colors.black54,
                showUnselectedLabels: true,

                elevation: 0, // Set to 0 since we're handling shadow manually
                type: BottomNavigationBarType.fixed,
                items: [
                  _buildNavItem(Images.home,'Home', 0,state.index),
                  _buildNavItem(Images.category,'Categories',1, state.index),
                  _buildNavItem(Images.shopping,'Shopping', 2,state.index),
                  _buildNavItem(Images.account,'Account', 3,state.index),
                ],
              ),
            ),
          ),
        );
      },
    );
  }



  BottomNavigationBarItem _buildNavItem(String icon,  String label, int index,int currentIndex) {
    return BottomNavigationBarItem(

      icon:Image.asset(icon,height: 20.h, )  ,
      activeIcon:  Image.asset(icon,height: 24.h,color: Theme.of(context).primaryColor, ),
      label: label,

    );
  }







}