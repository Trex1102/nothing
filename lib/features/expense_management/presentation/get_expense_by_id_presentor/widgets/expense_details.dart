import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/network/network_info_impl.dart';
import '../../../../common/presentation/widgets/custom_text_styles.dart';
import '../../../data/datasources/expense_datasource_impl.dart';
import '../../../data/datasources/local_storage.dart';
import '../../../data/repositories/expense_repository_impl.dart';
import '../../../domain/usecases/get_expense_by_id.dart';
import '../bloc/get_expense_by_id_bloc.dart';
import '../../../../../core/database/database_initializer.dart';
import 'package:intl/intl.dart';

class ShowDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMMM, y').format(DateTime.now());

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 250,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(217, 217, 217, 1),
            ),
            child: Center(
              child: Text(
                formattedDate,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: GoogleFonts.mPlusRounded1c().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseDetails extends StatelessWidget {
  ExpenseDetails({super.key});

  final customTextStyle = CustomTextStyle();

  Future<GetExpenseById> _initializeDependencies() async {
    final database = await DatabaseInitializer.initDatabase();
    final localStorage = LocalStorage(database);
    final expenseDataSource = ExpenseDataSourceImpl(localStorage);
    final connectivity = Connectivity();
    final networkInfo = NetworkInfoImpl(connectivity);

    final expenseRepository = ExpenseRepositoryImpl(
      expenseDataSource: expenseDataSource,
      networkInfo: networkInfo,
    );
    final getExpenseById = GetExpenseById(expenseRepository);

    return getExpenseById;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //return Container(

    return FutureBuilder<GetExpenseById>(
        future: _initializeDependencies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for initialization, show a loading indicator or placeholder
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // If an error occurs during initialization, handle it appropriately
            return Text('Error: ${snapshot.error}');
          } else {
            // When initialization is complete, use the initialized GetExpenseById
            final getExpenseById = snapshot.data;

            return BlocProvider<GetExpenseByIdBloc>(
                create: (context) => getExpenseById != null
                    ? GetExpenseByIdBloc(getExpenseById: getExpenseById)
                    : throw Exception(
                        'Failed to initialize GetExpenseByIdBloc'),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 300),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(),
                              1: IntrinsicColumnWidth(),
                              2: FlexColumnWidth(),
                            },
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        "Amount",
                                        style: customTextStyle.labelTextStyle,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        " ",
                                        style: customTextStyle.labelTextStyle,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: BlocBuilder<GetExpenseByIdBloc,
                                          GetExpenseByIdState>(
                                        builder: (context, state) {
                                          if (state.status ==
                                              GetExpenseByIdStatus.success) {
                                            // Check if expense is not null
                                            if (state.expense != null) {
                                              // Display the fetched expense amount
                                              return Text(
                                                state.expense!.amount
                                                    .toString(),
                                                style: CustomTextStyle
                                                    .defaultTextStyle,
                                              );
                                            } else {
                                              // Handle case where expense is null
                                              return Text(
                                                "Expense not found",
                                                style: CustomTextStyle
                                                    .defaultTextStyle,
                                              );
                                            }
                                          } else {
                                            // Handle loading or failure state
                                            return Text(
                                              " Loading...",
                                              style: CustomTextStyle
                                                  .defaultTextStyle,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        "Category",
                                        style: customTextStyle.labelTextStyle,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text(
                                      " ",
                                      style: customTextStyle.labelTextStyle,
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        " cat",
                                        style: CustomTextStyle.defaultTextStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        "Note",
                                        style: customTextStyle.labelTextStyle,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text(
                                      " ",
                                      style: customTextStyle.labelTextStyle,
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        " notee",
                                        style: CustomTextStyle.defaultTextStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        "Day",
                                        style: customTextStyle.labelTextStyle,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text(
                                      " ",
                                      style: customTextStyle.labelTextStyle,
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        " Thursday",
                                        style: CustomTextStyle.defaultTextStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(children: [
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Text(
                                      "Weather",
                                      style: customTextStyle.labelTextStyle,
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Text(
                                      " ",
                                      style: customTextStyle.labelTextStyle,
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Text(
                                      " rainy",
                                      style: CustomTextStyle.defaultTextStyle,
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }
        });
  }
}
