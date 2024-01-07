import "package:auto_route/annotations.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get_it/get_it.dart";

import "../password.dart";
import "../state/password_state.dart";
import "../state/passwords_cubit.dart";

class _MyPasswordsScreenState extends State<MyPasswordsScreen> {
  final getIt = GetIt.instance;
  Size? simulatorSize;

  final List<CategoryItem> categories = [
    CategoryItem(title: "All Categories", isSelected: true),
    CategoryItem(title: "Passwords"),
    CategoryItem(title: "Personal Info"),
    CategoryItem(title: "Personal Info"),
    CategoryItem(title: "Personal Info"),
    CategoryItem(title: "Personal Info"),
  ];


  @override
  Widget build(final BuildContext context) {
    final cubit = getIt<PasswordsCubit>();

    return MobileScreenSimulator(
      child: BlocBuilder<PasswordsCubit, MyPasswordsState>(
          bloc: cubit, // Provide the cubit
          builder: (final context, final state) {
            final services = state.uiPasswords;
            final searchQuery = state.searchQuery;

            return Scaffold(
              backgroundColor: const Color(0xFF4B3A71),
              appBar: AppBar(
                elevation: 0,
                actions: const <Widget>[],
                backgroundColor: Colors.transparent,
              ),
              body: Column(
                children: [
                  CustomSearchBar(
                    onChange: (final value) {
                      cubit.searchQuery(value);
                    },
                    onClear: cubit.clearSearchQuery,
                  ),
                  Text(searchQuery),
                  const SizedBox(height: 16),
                  CategoryListWidget(
                      categories: categories,
                      onCategorySelected: (final id) {
                        id;
                      },),
                  const SizedBox(height: 16),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SortButton(onSort: () {}),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ServiceList(
                        services: services,
                        onServiceSelected: (final id) {
                          id;
                        },),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if(simulatorSize == null) return;

                  showModalBottomSheet<void>(
                    backgroundColor: const Color(0xFF4B3A71),
                    context: context,
                    constraints: BoxConstraints(
                      minWidth: simulatorSize!.width,
                      maxWidth: simulatorSize!.width,
                      maxHeight: simulatorSize!.height / 4 ,
                      minHeight: simulatorSize!.height / 4,
                    ),
                    builder: (final context) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Modal BottomSheet"),
                          ElevatedButton(
                            child: const Text("Close BottomSheet"),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                  );
                },
                foregroundColor: const Color(0xFF4B3A71),
                backgroundColor: const Color(0xFFF6CDB6),
                shape: const CircleBorder(),
                child: const Icon(FontAwesomeIcons.plus),
              ),
            );
          },
      ),
      onSizeChanged: (final size) {
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

  const CategoryButton({required this.label, super.key});
  final String label;

  @override
  Widget build(final BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        child: Text(label),
        onPressed: () {},
      ),
    );
}

class ServiceList extends StatelessWidget {

  const ServiceList({
    required this.services, required this.onServiceSelected, super.key,
  });
  final List<PasswordItem> services;
  final Function(int) onServiceSelected;

  @override
  Widget build(final BuildContext context) => ListView.separated(
      itemCount: services.length,
      itemBuilder: (final context, final index) {
        final service = services[index];
        return ServiceItemWidget(
            icon: service.serviceIcon,
            title: service.service,
            email: service.login,
            onCopy: () {},
            onDelete: () {},);
      },
      separatorBuilder: (final context, final index) => const SizedBox(height: 24),
    );
}

class ServiceItemWidget extends StatelessWidget {

  const ServiceItemWidget({
    required this.title, required this.email, required this.icon, required this.onCopy, required this.onDelete, super.key,
  });
  final String title;
  final String email;
  final IconData icon;
  final VoidCallback onCopy;
  final VoidCallback onDelete;

  @override
  Widget build(final BuildContext context) => Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF4B3A71),
                // Replace with your desired background color
                borderRadius:
                    BorderRadius.circular(6), // Adjust the radius as needed
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  icon,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
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
                children: [
                  CustomIconButton(
                    size: 22,
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
            ),
          ],
        ),
      ),
    );
}

class CustomIconButton extends StatelessWidget {

  const CustomIconButton({
    required this.icon, required this.onPressed, required this.size, super.key,
  });
  final IconData icon;
  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(final BuildContext context) => SizedBox(
      height: 32,
      width: 32,
      child: IconButton(
        icon: Icon(
          icon,
          color: const Color(0xFF4B3A71),
        ),
        onPressed: onPressed,
        splashRadius: 22,
        iconSize: size,
        padding: const EdgeInsets.all(0),
        // Removes padding if not needed
        alignment: Alignment.center,
      ),
    );
}

class CategoryItem {

  CategoryItem({required this.title, this.isSelected = false});
  String title;
  bool isSelected;
}

class CategoryListWidget extends StatelessWidget {

  const CategoryListWidget({
    required this.categories, required this.onCategorySelected, super.key,
  });
  final List<CategoryItem> categories;
  final Function(int) onCategorySelected;

  @override
  Widget build(final BuildContext context) => SizedBox(
      height: 40, // Fixed height for the button bar
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (final context, final index) {
          final categoryItem = categories[index];

          return Padding(
            padding: EdgeInsets.only(
                left: index == 0 ? 16 : 0,
                right: index == categories.length - 1 ? 16 : 8,),
            child: ElevatedButton(
              onPressed: () => onCategorySelected(index),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      12,), // Adjust the radius here for more or less rounded corners
                ),
                backgroundColor: categoryItem.isSelected
                    ? const Color(0xFFF6CDB6)
                    : Colors.white, // Background Color
              ),
              child: Text(
                categoryItem.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: categoryItem.isSelected
                      ? const Color(0xFF4B3A71)
                      : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
}

class SortButton extends StatelessWidget {

  const SortButton({required this.onSort, super.key});
  final VoidCallback onSort;

  @override
  Widget build(final BuildContext context) => TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (final states) {
          return Colors.transparent; // Defer to the widget's default.
        }),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "SORT BY",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 2,
          ),
          SvgPicture.asset("assets/svgs/arrowUpDown.svg",
              width: 14,
              height: 14,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),),
        ],
      ),
      onPressed: () {},
    );
}

class CustomSearchBar extends StatefulWidget {

  const CustomSearchBar({
    required this.onChange, required this.onClear, super.key,
  });

  final Function(String) onChange;
  final VoidCallback onClear;

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState(onChange: onChange,onClear: onClear,);
}

class _CustomSearchBarState extends State<CustomSearchBar> {

  _CustomSearchBarState({
    required this.onChange,
    required this.onClear,
  }) : super();
  final Function(String) onChange;
  final VoidCallback onClear;

  final FocusNode _focusNode = FocusNode();

  final TextEditingController _controller = TextEditingController();

  _changeValue(){
    onChange(_controller.text);
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_changeValue);
  }

  @override
  Widget build(final BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            hintText: 'Search "passwords"',
            border: InputBorder.none,
            prefixIcon: IconButton(
                splashRadius: 16,
                icon: const Icon(Icons.search, color: Colors.grey),
                onPressed: () {
                  FocusScope.of(context).requestFocus(_focusNode);
                },),
            suffixIcon: _controller.text.isNotEmpty ? IconButton(
              splashRadius: 16,
              icon: const Icon(Icons.clear, color: Colors.grey),
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

class MobileScreenSimulator extends StatelessWidget {

  const MobileScreenSimulator({required this.child, super.key, this.onSizeChanged});
  final Widget child;
  final Function(Size)? onSizeChanged;

  @override
  Widget build(final BuildContext context) => Center(
      child: LayoutBuilder(
        builder: (final context, final constraints) {
          // Calculate width based on parent constraints and aspect ratio
          var width = constraints.maxWidth;
          var height = width * (16 / 9);
          if (height > constraints.maxHeight) {
            height = constraints.maxHeight;
            width = height * (9 / 16);
          }

          WidgetsBinding.instance.addPostFrameCallback((final _) {
            // Call the callback with the calculated size
            onSizeChanged?.call(Size(width, height));
          });

          return AspectRatio(
            aspectRatio: 9 / 16,
            child: SizedBox(
              width: width,
              child: child, // Use the passed child widget
            ),
          );
        },
      ),
    );
}