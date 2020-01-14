//
//  DataBaseManager.swift
//  Exporter
//
//  Created by Meonardo on 2020/1/14.
//  Copyright © 2020 Meonardo. All rights reserved.
//

import Foundation
import FMDB

final class DataBaseManager {

	public static let `default` = DataBaseManager()
	
	private let productTable = "PRODUCT"
	private let orderTable = "ORDER_S"
	private let buyerTable = "BUYER"
	var dbQueue: FMDatabaseQueue!
	
	private init() {
		createDatabase()
	}
	
	public func serve() {}
	
	private func createDatabase() {
		guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
			fatalError("Create db file Failed")
		}
		let dbPath = path + "/data.db"
		dbQueue = FMDatabaseQueue(path: dbPath)
		dbQueue.inDatabase { [weak self] (db) in
			if db.open() {
				self?.createTables(db: db)
			} else {
				fatalError("Unable to open db")
			}
		}
	}
	
	private func createTables(db: FMDatabase) {
		let productSql =
"""
CREATE TABLE IF NOT EXISTS \(productTable) (product_id TEXT PRIMARY KEY NOT NULL, name TEXT, model TEXT, desc TEXT, price FLOAT, image_path TEXT)
"""
		let orderSql =
"""
CREATE TABLE IF NOT EXISTS \(orderTable) (order_id TEXT PRIMARY KEY NOT NULL, date DOUBLE, product_id TEXT, buyer_id TEXT)
"""
		let buyerSql =
"""
CREATE TABLE IF NOT EXISTS \(buyerTable) (buyer_id TEXT PRIMARY KEY NOT NULL, name TEXT, add_date DOUBLE, country TEXT, address TEXT, company TEXT, contact TEXT)
"""
		let sqls = [productSql, orderSql, buyerSql]
		sqls.forEach { (sql) in
			do {
				try db.executeUpdate(sql, values: nil)
			} catch {
				print("Create table failed with error: \(error.localizedDescription)")
			}
		}
	}
}
