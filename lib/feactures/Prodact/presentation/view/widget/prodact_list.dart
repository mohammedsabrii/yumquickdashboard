import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/widget/fliter_search_edit_and_delete_header.dart';
import 'package:yumquickdashboard/feactures/Prodact/manger/cubits/products_cubit/products_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/model/prodact_table_model.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/prodact_teble_row.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/prodact_teble_row_header.dart';

class ProdactList extends StatefulWidget {
  const ProdactList({super.key});

  @override
  State<ProdactList> createState() => _ProdactListState();
}

class _ProdactListState extends State<ProdactList> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().loadProducts(); // ✅ load when widget mounts
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.876,
      width: MediaQuery.sizeOf(context).width * 0.77,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.0218,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FliterSearchEditAndDeleteHeader(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0145),

              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductsSuccess) {
                    return ProductsTable(
                      products: state.products,
                    ); // ✅ show data
                  } else if (state is ProductsFailure) {
                    return Center(child: Text("Error: ${state.errorMessage}"));
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductsTable extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductsTable({super.key, this.products = const []});

  @override
  Widget build(BuildContext context) {
    return Table(
      // columnWidths: {
      //   0: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.254),
      //   1: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.111),
      //   2: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.111),
      //   3: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.111),
      //   4: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.111),
      // },
      children: [
        prodactsTableRowHeader(context),
        ...List.generate(
          products.length,
          (index) =>
              prodactsTableRow(context, prodactTableModel: products[index]),
        ),
      ],
    );
  }
}
