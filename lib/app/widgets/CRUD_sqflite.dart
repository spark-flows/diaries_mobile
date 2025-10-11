import 'package:diaries/app/app.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// class ProductDBManager {
//    late Database _db;
//    List<ProductDetailData> productList = [];

//    Future<void> initDB() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'products.db');

//     _db = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE products(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             name TEXT,
//             price REAL,
//             quantity INTEGER
//           )
//         ''');
//       },
//     );

//     await fetchAll();
//   }

//    Future<void> addProduct(ProductDetailData product) async {
//     final id = await _db.insert('products', product.toMap());
//     productList.add(product.copyWith(id: id.toString()));
//   }

//    Future<void> updateProduct(ProductDetailData product) async {
//     await _db.update(
//       'products',
//       product.toMap(),
//       where: 'id = ?',
//       whereArgs: [product.id],
//     );
//     int index = productList.indexWhere((p) => p.id == product.id);
//     if (index != -1) productList[index] = product;
//   }

//    Future<void> deleteProduct(String id) async {
//     await _db.delete('products', where: 'id = ?', whereArgs: [id]);
//     productList.removeWhere((p) => p.id == id);
//   }

//  Future<void> fetchAll() async {
//     final List<Map<String, dynamic>> maps = await _db.query('products');
//     productList = maps.map((map) => ProductDetailData.fromMap(map)).toList();
//   }

//    List<ProductDetailData> getProducts() => productList;
// }

// Second Code

// class ProductDBManager {
//   static final ProductDBManager instance = ProductDBManager._internal();
//   ProductDBManager._internal();

//   static Database? _db;

//   /// Initialize DB
//   Future<void> initDB() async {
//     if (_db != null) return; // already initialized

//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'product_database.db');

//     _db = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE product_table (
//             id TEXT PRIMARY KEY,
//             designno TEXT,
//             srjobno TEXT,
//             collection TEXT,
//             inwardno TEXT,
//             category TEXT,
//             subcategory TEXT,
//             size TEXT,
//             metaltype TEXT,
//             metalcolor TEXT,
//             gWt REAL,
//             metalweight REAL,
//             purchasefine REAL,
//             salefine INTEGER,
//             dCt REAL,
//             diamondpcs INTEGER,
//             csct INTEGER,
//             cspcs INTEGER,
//             miscct INTEGER,
//             miscpcs INTEGER,
//             status TEXT,
//             invoiceno TEXT,
//             customer TEXT,
//             price REAL,
//             location TEXT,
//             huid TEXT,
//             producttype TEXT,
//             certificateno TEXT,
//             createdAt TEXT,
//             updatedAt TEXT
//           )
//         ''');
//       },
//     );
//   }

//   /// Insert Product
//   Future<void> insert(ProductDetailData product) async {
//     await initDB();
//     await _db!.insert(
//       'product_table',
//       product.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   /// Fetch all products
//   Future<List<ProductDetailData>> fetchAll() async {
//     await initDB();
//     final List<Map<String, dynamic>> maps = await _db!.query('product_table');
//     return maps.map((map) => ProductDetailData.fromMap(map)).toList();
//   }

//   /// Update product
//   Future<void> update(ProductDetailData product) async {
//     await initDB();
//     await _db!.update(
//       'product_table',
//       product.toMap(),
//       where: 'id = ?',
//       whereArgs: [product.id],
//     );
//   }

//   /// Delete product
//   Future<void> delete(String id) async {
//     await initDB();
//     await _db!.delete(
//       'product_table',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }

//   /// Clear all products (optional)
//   Future<void> clearAll() async {
//     await initDB();
//     await _db!.delete('product_table');
//   }

//   /// Close DB (optional)
//   Future<void> closeDB() async {
//     await _db?.close();
//     _db = null;
//   }
// }

class ProductDbHelper {
   Database? _db;

    Future<void> open() async {
    if (_db != null && _db!.isOpen) return;
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_products.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE products (
            id TEXT PRIMARY KEY,
            designno TEXT,
            srjobno TEXT,
            collection TEXT,
            inwardno TEXT,
            category TEXT,
            subcategory TEXT,
            size TEXT,
            metaltype TEXT,
            metalcolor TEXT,
            gWt REAL,
            metalweight REAL,
            purchasefine REAL,
            salefine INTEGER,
            dCt REAL,
            diamondpcs INTEGER,
            csct INTEGER,
            cspcs INTEGER,
            miscct INTEGER,
            miscpcs INTEGER,
            status TEXT,
            invoiceno TEXT,
            customer TEXT,
            price REAL,
            location TEXT,
            huid TEXT,
            producttype TEXT,
            certificateno TEXT,
            createdAt TEXT,
            updatedAt TEXT
          )
        ''');
      },
    );
  }

   Future<void> close() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }

  Future<void> insertProduct(ProductDetailData product) async {
    await open();
    await _db!.insert(
      'products',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    Utility.snacBar('Product Add into Cart', ColorsValue.appColor);
  }

   Future<List<ProductDetailData>> getAllProducts() async {
    await open();
    final List<Map<String, dynamic>> maps = await _db!.query('products');
    return maps.map((m) => ProductDetailData.fromMap(m)).toList();
  }

   Future<void> updateProduct(ProductDetailData product) async {
    await open();
    await _db!.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

   Future<void> deleteProduct(String id) async {
    await open();
    await _db!.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
    
  }
}



/// Usrswrs Of this fuinctions 
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final productManager = ProductDBManager();
//   await productManager.initDB();

//   // Create
//   await productManager.addProduct(ProductDetailData(
//     name: "Apple",
//     price: 2.5,
//     quantity: 10,
//   ));

//   // Read
//   productManager.getProducts().forEach((p) => print(p.name));

//   // Update
//   final existing = productManager.getProducts().first;
//   await productManager.updateProduct(existing.copyWith(price: 3.0));

//   // Delete
//   await productManager.deleteProduct(existing.id!);
// }
