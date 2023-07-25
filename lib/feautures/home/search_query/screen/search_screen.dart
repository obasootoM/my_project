import 'package:flutter/material.dart';
import 'package:my_project/constant/global_variablee.dart';
import 'package:my_project/constant/loading.dart';
import 'package:my_project/feautures/home/search_query/service/search_service.dart';
import 'package:my_project/feautures/home/search_query/widget/search-product.dart';
import 'package:my_project/feautures/home/widget/additional_box.dart';
import 'package:my_project/model/product.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String search;

  const SearchScreen({super.key, required this.search});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchService searchService = SearchService();
  List<Product>? product;

  @override
  void initState() {
    super.initState();
    fetchSearchProduct();
  }

  void fetchSearchProduct() async {
    product = await searchService.fetchProductService(
        context: context, search: widget.search);
    setState(() {});
  }
   void navigateToSearchscreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariable.appGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        onFieldSubmitted: navigateToSearchscreen,
                        decoration: const InputDecoration(
                            prefixIcon: InkWell(
                              child: Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 23,
                                ),
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.only(top: 10),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                borderSide: BorderSide.none),
                            hintText: 'Search Amazon.in',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17)),
                      ),
                    )),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: const Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 24,
                ),
              )
            ],
          ),
        ),
      ),
        body: product == null ? const Loading() 
        :Column(
      children: [
        const AdditionalBox(),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: product!.length,
                itemBuilder: (context, index) {
                  return SearchProduct(product: product![index]);
                }))
      ],
    ));
  }
}
