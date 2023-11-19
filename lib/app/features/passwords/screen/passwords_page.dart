import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

import '../password.dart';
import '../state/password_state.dart';
import '../state/passwords_cubit.dart';

class _MyPasswordsScreenState extends State<MyPasswordsScreen> {
  final getIt = GetIt.instance;
  Size? simulatorSize;

  final List<CategoryItem> categories = [
    CategoryItem(title: 'All Categories', isSelected: true),
    CategoryItem(title: 'Passwords'),
    CategoryItem(title: 'Personal Info'),
    CategoryItem(title: 'Personal Info'),
    CategoryItem(title: 'Personal Info'),
    CategoryItem(title: 'Personal Info'),
  ];


  @override
  Widget build(BuildContext context) {
    final cubit = getIt<PasswordsCubit>();

    return MobileScreenSimulator(
      child: BlocBuilder<PasswordsCubit, MyPasswordsState>(
          bloc: cubit, // Provide the cubit
          builder: (context, state) {
            final services = state.uiPasswords;
            final searchQuery = state.searchQuery;

            return Scaffold(
              backgroundColor: Color(0xFF4B3A71),
              appBar: AppBar(
                elevation: 0,
                actions: <Widget>[],
                backgroundColor: Colors.transparent,
              ),
              body: Column(
                children: [
                  CustomSearchBar(
                    onChange: (value) {
                      cubit.searchQuery(value);
                    },
                    onClear: () {
                      cubit.clearSearchQuery();
                    },
                  ),
                  Text(searchQuery),
                  SizedBox(height: 16),
                  CategoryListWidget(
                      categories: categories,
                      onCategorySelected: (id) {
                        id;
                      }),
                  SizedBox(height: 16),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SortButton(onSort: () {}),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ServiceList(
                        services: services,
                        onServiceSelected: (id) {
                          id;
                        }),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if(simulatorSize == null) return;

                  showModalBottomSheet<void>(
                    backgroundColor: Color(0xFF4B3A71),
                    context: context,
                    constraints: BoxConstraints(
                      minWidth: simulatorSize!.width,
                      maxWidth: simulatorSize!.width,
                      maxHeight: simulatorSize!.height / 4 ,
                      minHeight: simulatorSize!.height / 4,
                    ),
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Modal BottomSheet'),
                          ElevatedButton(
                            child: const Text('Close BottomSheet'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    },
                  );
                },
                foregroundColor: Color(0xFF4B3A71),
                backgroundColor: Color(0xFFF6CDB6),
                shape: CircleBorder(),
                child: const Icon(FontAwesomeIcons.plus),
              ),
            );
          },
      ),
      onSizeChanged: (size) {
        print("Simulator size: $size");

        if (simulatorSize == null || simulatorSize != size) {
          setState(() {
            simulatorSize = size;
          });
        }
      },
    );
  }
}

@RoutePage()
class MyPasswordsScreen extends StatefulWidget {
  const MyPasswordsScreen({super.key});

  @override
  _MyPasswordsScreenState createState() => _MyPasswordsScreenState();
}

class CategoryButton extends StatelessWidget {
  final String label;

  CategoryButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        child: Text(label),
        onPressed: () {},
      ),
    );
  }
}

class ServiceList extends StatelessWidget {
  final List<PasswordItem> services;
  final Function(int) onServiceSelected;

  ServiceList({
    Key? key,
    required this.services,
    required this.onServiceSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: services.length,
      itemBuilder: (context, index) {
        var service = services[index];
        return ServiceItemWidget(
            icon: service.serviceIcon,
            title: service.service,
            email: service.login,
            onCopy: () {},
            onDelete: () {});
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 24);
      },
    );
  }
}

class ServiceItemWidget extends StatelessWidget {
  final String title;
  final String email;
  final IconData icon;
  final VoidCallback onCopy;
  final VoidCallback onDelete;

  ServiceItemWidget({
    Key? key,
    required this.title,
    required this.email,
    required this.icon,
    required this.onCopy,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF4B3A71),
                // Replace with your desired background color
                borderRadius:
                    BorderRadius.circular(6.0), // Adjust the radius as needed
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(email),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomIconButton(
                    size: 22.0,
                    icon: FontAwesomeIcons.copy,
                    onPressed: onCopy,
                  ),
                  // CustomIconButton(
                  //   size: 16.0,
                  //   icon: Icons.delete_outline,
                  //   onPressed: onDelete,
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double size;

  CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 32,
      child: IconButton(
        icon: Icon(
          icon,
          color: Color(0xFF4B3A71),
        ),
        onPressed: onPressed,
        splashRadius: 22,
        iconSize: size,
        padding: EdgeInsets.all(0),
        // Removes padding if not needed
        alignment: Alignment.center,
      ),
    );
  }
}

class CategoryItem {
  String title;
  bool isSelected;

  CategoryItem({required this.title, this.isSelected = false});
}

class CategoryListWidget extends StatelessWidget {
  final List<CategoryItem> categories;
  final Function(int) onCategorySelected;

  CategoryListWidget({
    Key? key,
    required this.categories,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0, // Fixed height for the button bar
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          var categoryItem = categories[index];

          return Padding(
            padding: EdgeInsets.only(
                left: index == 0 ? 16 : 0,
                right: index == categories.length - 1 ? 16 : 8),
            child: ElevatedButton(
              onPressed: () => onCategorySelected(index),
              child: Text(
                categoryItem.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: categoryItem.isSelected
                      ? Color(0xFF4B3A71)
                      : Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      12), // Adjust the radius here for more or less rounded corners
                ),
                backgroundColor: categoryItem.isSelected
                    ? Color(0xFFF6CDB6)
                    : Colors.white, // Background Color
              ),
            ),
          );
        },
      ),
    );
  }
}

class SortButton extends StatelessWidget {
  final VoidCallback onSort;

  SortButton({required this.onSort});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          return Colors.transparent; // Defer to the widget's default.
        }),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "SORT BY",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 2,
          ),
          SvgPicture.asset('svgs/arrowUpDown.svg',
              width: 14,
              height: 14,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn))
        ],
      ),
      onPressed: () {},
    );
  }
}

class CustomSearchBar extends StatefulWidget {

  final Function(String) onChange;
  final VoidCallback onClear;

  CustomSearchBar({
    Key? key,
    required this.onChange,
    required this.onClear,
  }) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState(onChange: onChange,onClear: onClear,);
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final Function(String) onChange;
  final VoidCallback onClear;

  final FocusNode _focusNode = FocusNode();

  final TextEditingController _controller = TextEditingController();

  _CustomSearchBarState({
    required this.onChange,
    required this.onClear,
  }) : super();

  _changeValue(){
    onChange(_controller.text);
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_changeValue);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: TextFormField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16),
            hintText: 'Search "passwords"',
            border: InputBorder.none,
            prefixIcon: IconButton(
                splashRadius: 16,
                icon: Icon(Icons.search, color: Colors.grey),
                onPressed: () {
                  FocusScope.of(context).requestFocus(_focusNode);
                }),
            suffixIcon: _controller.text.isNotEmpty ? IconButton(
              splashRadius: 16,
              icon: Icon(Icons.clear, color: Colors.grey),
              onPressed: (){
                onClear();
                _controller.clear();
              },
            ) : null,
          ),
        ),
      ),
    );
  }
}

class MobileScreenSimulator extends StatelessWidget {
  final Widget child;
  final Function(Size)? onSizeChanged;

  const MobileScreenSimulator({Key? key, required this.child, this.onSizeChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate width based on parent constraints and aspect ratio
          double width = constraints.maxWidth;
          double height = width * (16 / 9);
          if (height > constraints.maxHeight) {
            height = constraints.maxHeight;
            width = height * (9 / 16);
          }

          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Call the callback with the calculated size
            onSizeChanged?.call(Size(width, height));
          });

          return AspectRatio(
            aspectRatio: 9 / 16,
            child: Container(
              width: width,
              child: child, // Use the passed child widget
            ),
          );
        },
      ),
    );
  }
}