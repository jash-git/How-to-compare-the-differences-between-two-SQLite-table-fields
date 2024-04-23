-- --------------------------------------------------------
-- 主機:                           C:\Users\devel\Desktop\VPOS_Maui\VPOS\bin\Debug\net7.0-windows10.0.19041.0\vpos.db
-- 伺服器版本:                        3.44.0
-- 伺服器作業系統:                      
-- HeidiSQL 版本:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 傾印 vpos 的資料庫結構
DROP DATABASE IF EXISTS "vpos";
CREATE DATABASE IF NOT EXISTS "vpos";
;

-- 傾印  資料表 vpos.account_data 結構
DROP TABLE IF EXISTS "account_data";
CREATE TABLE IF NOT EXISTS account_data
(
   SID                  int not null,
   account_code         varchar(50) not null,
   account_name         varchar(50) not null,
   type                 char(1) not null,
   sort                 int,
   stop_flag            char(1) default 'N',
   stop_time            int,
   del_flag             char(1) default 'N',
   del_time             int,
   created_time         timestamp,
   updated_time         timestamp,
   primary key (SID)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.basic_params 結構
DROP TABLE IF EXISTS "basic_params";
CREATE TABLE IF NOT EXISTS "basic_params" (
  "param_key" varchar(60) NOT NULL,
  "source_type" varchar,
  "param_value" text NOT NULL,
  "created_time" timestamp,
  "updated_time" timestamp,
  PRIMARY KEY ("param_key")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.city_code_data 結構
DROP TABLE IF EXISTS "city_code_data";
CREATE TABLE IF NOT EXISTS "city_code_data" (
  "code" varchar(20) NOT NULL,
  "code_type" char(1) NOT NULL,
  "parent_code" varchar(20),
  "show_name" varchar(30) NOT NULL,
  "sort" int NOT NULL DEFAULT 0,
  "stop_flag" char(1) NOT NULL DEFAULT 'N',
  "created_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp,
  PRIMARY KEY ("code")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.class_data 結構
DROP TABLE IF EXISTS "class_data";
CREATE TABLE IF NOT EXISTS "class_data" (
  "SID" int NOT NULL,
  "class_name" varchar(10) NOT NULL,
  "time_start" char(5),
  "time_end" char(5),
  "sort" int(2) NOT NULL DEFAULT 0,
  "del_flag" char(1) NOT NULL DEFAULT 'N',
  "del_time" timestamp NOT NULL DEFAULT '0000-00-00',
  "created_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("SID")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.company 結構
DROP TABLE IF EXISTS "company";
CREATE TABLE IF NOT EXISTS "company" (
  "SID" int NOT NULL,
  "company_no" varchar(25),
  "authorized_store_no" varchar(20),
  "company_name" varchar(50) NOT NULL,
  "company_shortname" varchar(20),
  "EIN" varchar(20),
  "business_name" varchar(50),
  "company_owner" varchar(30),
  "tel" varchar(25),
  "fax" varchar(25),
  "zip_code" varchar(10),
  "country_code" varchar(5) NOT NULL,
  "province_code" varchar(10) NOT NULL,
  "city_code" varchar(10) NOT NULL,
  "district_code" varchar(10) NOT NULL,
  "address" varchar(200) NOT NULL,
  "def_order_type" int DEFAULT T,
  "def_tax_sid" int,
  "def_unit_sid" int,
  "vtstore_order_url" varchar(200),
  "take_service_flag" char(1) DEFAULT 'N',
  "take_service_type" char(1),
  "take_service_val" decimal(5,2),
  "def_params" TEXT,
  "del_flag" char(1) DEFAULT 'N',
  "del_time" datetime DEFAULT NULL,
  "created_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("SID")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.company_customized_params 結構
DROP TABLE IF EXISTS "company_customized_params";
CREATE TABLE IF NOT EXISTS company_customized_params
(
   customized_code      varchar(30) not null,
   customized_name      varchar(30) not null,
   active_state         char(1) default 'N',
   params               text,
   created_time         timestamp,
   updated_time         timestamp,
   primary key (customized_code)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.company_invoice_params 結構
DROP TABLE IF EXISTS "company_invoice_params";
CREATE TABLE IF NOT EXISTS "company_invoice_params" (
  "company_sid" int NOT NULL,
  "platform_sid" int NOT NULL,
  "env_type" char(1) NOT NULL,
  "active_state" char(1) NOT NULL DEFAULT 'N',
  "branch_no" varchar(30),
  "reg_id" varchar(64),
  "qrcode_aes_key" varchar(32),
  "inv_renew_count" int DEFAULT 0,
  "booklet" int DEFAULT 0,
  "auth_account" varchar(50),
  "auth_password" varchar(50),
  "created_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("company_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.company_payment_params 結構
DROP TABLE IF EXISTS "company_payment_params";
CREATE TABLE IF NOT EXISTS "company_payment_params" (
	"payment_sid"	int NOT NULL,
	"active_state"	char(1) NOT NULL,
	"env_type"	char(1) NOT NULL,
	"client_id"	varchar(100),
	"client_secret"	varchar(100),
	"created_time"	timestamp,
	"updated_time"	timestamp,
	PRIMARY KEY("payment_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.company_payment_type 結構
DROP TABLE IF EXISTS "company_payment_type";
CREATE TABLE IF NOT EXISTS "company_payment_type" (
  "SID" int NOT NULL,
  "payment_code" varchar(20),
  "payment_name" varchar(30),
  "payment_module_code" varchar(50),
  "def_paid_flag" char(1) DEFAULT 'N',
  "def_paid_amount" decimal(10,2) DEFAULT 0,
  "no_change_flag" char(1) DEFAULT 'N',
  "del_flag" char(1) DEFAULT 'N',
  "del_time" datetime,
  "stop_flag" char(1),
  "stop_time" datetime,
  "sort" int DEFAULT 0,
  "created_time" timestamp,
  "updated_time" timestamp,
  PRIMARY KEY ("SID")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.condiment_data 結構
DROP TABLE IF EXISTS "condiment_data";
CREATE TABLE IF NOT EXISTS condiment_data
(
   SID                  int not null,
   company_sid          int not null,
   condiment_code       varchar(64),
   condiment_name       varchar(50) not null,
   condiment_price      decimal(10,2) not null,
   unit_sid             int,
   group_sid            int not null,
   sort                 int not null default 0,
   stop_flag            char(1) not null default 'N',
   stop_time            timestamp not null default NULL,
   del_flag             char(1) not null default 'N',
   del_time             timestamp not null default NULL,
   created_time         timestamp not null default NULL,
   updated_time         timestamp not null default NULL,
   primary key (SID)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.condiment_group 結構
DROP TABLE IF EXISTS "condiment_group";
CREATE TABLE IF NOT EXISTS "condiment_group" (
  "SID" int NOT NULL,
  "company_sid" int NOT NULL,
  "group_name" varchar(20) NOT NULL,
  "required_flag" char(1) NOT NULL DEFAULT 'N',
  "single_flag" char(1) NOT NULL DEFAULT 'N',
  "newline_flag" char(1) NOT NULL DEFAULT 'N',
  "count_flag" char(1) NOT NULL DEFAULT 'N',
  "min_count" int DEFAULT 0,
  "max_count" int DEFAULT 0,
  "sort" int(3) NOT NULL DEFAULT 0,
  "del_flag" char(1) NOT NULL DEFAULT 'N',
  "del_time" datetime DEFAULT NULL,
  "created_time" timestamp,
  "updated_time" timestamp,
  PRIMARY KEY ("SID", "company_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.cust_display_content 結構
DROP TABLE IF EXISTS "cust_display_content";
CREATE TABLE IF NOT EXISTS "cust_display_content" (
  "display_data_sid" int NOT NULL,
  "item_no" int NOT NULL,
  "content" text,
  PRIMARY KEY ("display_data_sid", "item_no")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.cust_display_data 結構
DROP TABLE IF EXISTS "cust_display_data";
CREATE TABLE IF NOT EXISTS "cust_display_data" (
  "SID" int NOT NULL,
  "data_name" varchar(50),
  "data_kind" char(2),
  "source_type" char(1),
  "stretch_size" char(1) DEFAULT 'N',
  "play_type" char(1),
  "play_speed_sec" int,
  "del_flag" char(1) DEFAULT 'N',
  "created_time" timestamp,
  "updated_time" timestamp,
  PRIMARY KEY ("SID")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.cust_display_param 結構
DROP TABLE IF EXISTS "cust_display_param";
CREATE TABLE IF NOT EXISTS "cust_display_param" (
  "display_show" char(1) DEFAULT 'N',
  "layout_id" int DEFAULT 0,
  "display_size_str" varchar(15),
  "form_width" int DEFAULT 0,
  "form_height" int DEFAULT 0,
  "cf_banner_height" int,
  "cf_show_data_sid" int,
  "mp_play_data_sid" int,
  "ol_label_data_sid" int,
  "created_time" timestamp,
  "updated_time" timestamp
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.cust_screen_param 結構
DROP TABLE IF EXISTS "cust_screen_param";
CREATE TABLE IF NOT EXISTS "cust_screen_param" (
  "terminal_sid" varcahr(30) NOT NULL,
  "layout_id" int DEFAULT 0,
  "show_flag" char(1) DEFAULT 'N',
  "screen_width" int DEFAULT 0,
  "screen_height" int DEFAULT 0,
  "created_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("terminal_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.daily_report 結構
DROP TABLE IF EXISTS "daily_report";
CREATE TABLE IF NOT EXISTS "daily_report" (
  "report_no" varchar(20) NOT NULL,
  "report_type" char(1) NOT NULL,
  "report_time" datetime NOT NULL,
  "business_day" datetime,
  "class_sid" int DEFAULT 0,
  "class_name" varchar(20),
  "employee_no" varchar(20),
  "order_start_time" datetime NOT NULL,
  "order_end_time" datetime NOT NULL,
  "order_count" int DEFAULT 0,
  "sale_total" decimal(10,2) DEFAULT 0,
  "sale_item_count" int DEFAULT 0,
  "sale_item_avg_cost" decimal(10,2) DEFAULT 0,
  "cancel_count" int DEFAULT 0,
  "cancel_total" decimal(10,2) DEFAULT 0,
  "other_cancel_count" int DEFAULT 0,
  "other_cancel_total" decimal(10,2) DEFAULT 0,
  "discount_total" decimal(10,2) DEFAULT 0,
  "promotion_total" decimal(10,2) DEFAULT 0,
  "coupon_total" decimal(10,2) DEFAULT 0,
  "tax_total" decimal(10,2) DEFAULT 0,
  "service_total" decimal(10,2) DEFAULT 0,
  "trans_reversal" decimal(10,2) DEFAULT 0,
  "over_paid" decimal(10,2) DEFAULT 0,
  "sale_amount" decimal(10,2) DEFAULT 0,
  "refund_cash_total" decimal(10,2) DEFAULT 0,
  "cash_total" decimal(10,2) DEFAULT 0,
  "payment_info" text,
  "payment_cash_total" decimal(10,2) DEFAULT 0,
  "expense_info" text,
  "expense_cash_total" decimal(10,2) DEFAULT 0,
  "coupon_info" text,
  "category_sale_info" TEXT,
  "promotions_info" text,
  "stock_push_amount" decimal(10,2) DEFAULT 0,
  "stock_pull_amount" decimal(10,2) DEFAULT 0,
  "inv_summery_info" text,
  "upload_flag" char(1) DEFAULT 'N',
  "upload_time" datetime, checkout_info TEXT  DEFAULT null, delivery_total decimal(10, 2)  DEFAULT 0,
  PRIMARY KEY ("report_no", "report_type")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.device_config 結構
DROP TABLE IF EXISTS "device_config";
CREATE TABLE IF NOT EXISTS "device_config" (
  "device_sid" varchar(10) NOT NULL,
  "device_type" int,
  "page_size" int,
  "device_model" varchar(30),
  "conn_io_type" char(1),
  "tcp_ip" char(15),
  "tcp_port" int,
  "port_name" varchar(10),
  "baud_rate" int,
  "flow_control" int,
  "onoff_flag" char(1) DEFAULT 'N',
  "auto_print_flag" char(1) DEFAULT 'N',
  "cash_box_flag" char(1) DEFAULT N,
  "formula_print_flag" char(1) DEFAULT N,
  "print_bill_flag" char(1) DEFAULT 'N',
  "print_logo_flag" char(1) DEFAULT 'N',
  "updated_time" timestamp,
  PRIMARY KEY ("device_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.discount_hotkey 結構
DROP TABLE IF EXISTS "discount_hotkey";
CREATE TABLE IF NOT EXISTS "discount_hotkey" (
  "SID" int NOT NULL,
  "hotkey_name" varchar(50) NOT NULL,
  "hotkey_code" varchar(50) NOT NULL,
  "discount_code" varchar(50) NOT NULL,
  "val_mode" char(1) DEFAULT 'F',
  "val" float,
  "round_calc_type" char(1) DEFAULT 'S',
  "stop_flag" char(1) DEFAULT 'N',
  "stop_time" datetime,
  "del_flag" char(1) DEFAULT 'N',
  "del_time" datetime,
  "sort" integer DEFAULT 0,
  "created_time" timestamp,
  "updated_time" timestamp,
  PRIMARY KEY ("SID")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.discount_param 結構
DROP TABLE IF EXISTS "discount_param";
CREATE TABLE IF NOT EXISTS "discount_param" (
  "SID" int NOT NULL,
  "discount_code" varchar(50) NOT NULL,
  "filter_type" varchar(10),
  "round_calc_type" char(1) DEFAULT 'S',
  "del_flag" char(1) DEFAULT 'N',
  "del_time" datetime,
  "created_time" timestamp,
  "updated_time" timestamp,
  PRIMARY KEY ("SID")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.discount_product_relation 結構
DROP TABLE IF EXISTS "discount_product_relation";
CREATE TABLE IF NOT EXISTS discount_product_relation
(
   discount_param_sid   int not null,
   product_sid          int not null,
   primary key (discount_param_sid, product_sid)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.employee_attendance_data 結構
DROP TABLE IF EXISTS "employee_attendance_data";
CREATE TABLE IF NOT EXISTS employee_attendance_data
(
   SID                  varchar(64) not null,
   emp_sid              int not null,
   emp_no               varchar(50),
   emp_name             varchar(50),
   check_in_flag        char(1) default 'N',
   check_in_time        datetime default NULL,
   check_in_terminal_sid varchar(30),
   check_out_flag       char(1) default 'N',
   check_out_time       datetime default NULL,
   check_out_terminal_sid varchar(30),
   finish_flag          char(1) default 'N',
   created_time         timestamp,
   updated_time         timestamp,
   primary key (SID)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.expense_data 結構
DROP TABLE IF EXISTS "expense_data";
CREATE TABLE IF NOT EXISTS expense_data
(
   expense_no           varchar(20) not null,
   action_time          int,
   action_user          varchar(30),
   account_code         varchar(50),
   account_name         varchar(50),
   account_type         char(1),
   money                decimal(20,5),
   payment_code         varchar(30),
   payment_name         varchar(30),
   remark               text,
   del_flag             char(1) default 'N',
   del_time             int,
   class_close_flag     char(1) default 'N',
   class_report_no      varchar(20),
   daily_close_flag     char(1) default 'N',
   daily_report_no      varchar(20),
   created_time         timestamp not null,
   updated_time         timestamp not null,
   primary key (expense_no)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.formula_data 結構
DROP TABLE IF EXISTS "formula_data";
CREATE TABLE IF NOT EXISTS formula_data
(
   SID                  int not null,
   formula_params       ntext,
   created_time         timestamp,
   updated_time         timestamp,
   primary key (SID)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.func_main 結構
DROP TABLE IF EXISTS "func_main";
CREATE TABLE IF NOT EXISTS "func_main" (
  "SID" varchar(50) NOT NULL,
  "func_type" char(1) NOT NULL,
  "parent_func_sid" varchar(50),
  "func_name" varchar(20) NOT NULL,
  "content" varchar(500),
  "sort" smallint DEFAULT 0,
  "stop_flag" char(1) NOT NULL DEFAULT 'N',
  "stop_time" datetime DEFAULT NULL,
  "del_flag" char(1) NOT NULL DEFAULT 'N',
  "del_time" datetime DEFAULT NULL,
  "created_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("SID")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.invoice_platform 結構
DROP TABLE IF EXISTS "invoice_platform";
CREATE TABLE IF NOT EXISTS "invoice_platform" (
  "SID" int NOT NULL,
  "platform_name" varchar(50),
  "inv_url_1" varchar(1024),
  "inv_url_2" varchar(1024),
  "inv_test_url_1" varchar(1024),
  "inv_test_url_2" varchar(1024),
  "created_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("SID")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.member_platform_params 結構
DROP TABLE IF EXISTS "member_platform_params";
CREATE TABLE IF NOT EXISTS member_platform_params
(
   SID                  int not null,
   platform_type        varchar(30),
   params               text,
   sort                 int,
   stop_flag            char(1) not null default 'N',
   stop_time            datetime,
   del_flag             char(1) not null default 'N',
   del_time             datetime,
   created_time         timestamp,
   updated_time         timestamp,
   primary key (SID)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.order_calc_formula 結構
DROP TABLE IF EXISTS "order_calc_formula";
CREATE TABLE IF NOT EXISTS order_calc_formula
(
   order_no             varchar(30) not null,
   item_no              int not null,
   operator_text        text,
   print_count          int default 0,
   print_flag           char(1) default 'N',
   created_time         timestamp,
   primary key (order_no, item_no)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.order_content_data 結構
DROP TABLE IF EXISTS "order_content_data";
CREATE TABLE IF NOT EXISTS "order_content_data" (
  "order_no" varchar(30) NOT NULL,
  "item_no" int NOT NULL,
  "data_type" char(1) NOT NULL DEFAULT 'A',
  "item_type" char(1) NOT NULL,
  "item_code" varchar(64),
  "item_group_code" varchar(64),
  "item_group_name" varchar(64),
  "show_detail_flag" char(1) DEFAULT 'N',
  "condiment_group_sid" int DEFAULT 0,
  "parent_item_no" int DEFAULT 0,
  "item_sid" int NOT NULL,
  "item_spec_sid" int,
  "item_name" varchar(60) NOT NULL,
  "item_cost" decimal(10,2) NOT NULL DEFAULT 0,
  "item_count" decimal(10,2) NOT NULL DEFAULT 0,
  "condiment_price" decimal(10,2) DEFAULT 0,
  "item_subtotal" decimal(10,2) NOT NULL DEFAULT 0,
  "discount_type" char(1) DEFAULT 'N',
  "discount_code" varchar(60),
  "discount_name" varchar(60),
  "discount_rate" decimal(10,2),
  "discount_fee" decimal(10,2),
  "discount_info" text,
  "stock_remainder_quantity" int DEFAULT 0,
  "stock_push_price" decimal(10,2) DEFAULT 0,
  "stock_push_quantity" int DEFAULT 0,
  "stock_push_amount" decimal(10,2) DEFAULT 0,
  "stock_pull_code" varchar(60),
  "stock_pull_name" varchar(60),
  "stock_pull_price" decimal(10,2) DEFAULT 0,
  "stock_pull_quantity" int DEFAULT 0,
  "stock_pull_amount" decimal DEFAULT 0,
  "external_id" varchar(100),
  "external_mode" varchar(50),
  "external_description" text,
  "tax_sid" int,
  "tax_rate" decimal(10,2) DEFAULT 0,
  "tax_type" char(1),
  "tax_fee" decimal(10,2) DEFAULT 0,
  "item_amount" decimal(10,2) DEFAULT 0,
  "subtotal_flag" char(1) DEFAULT 'N',
  "subtotal_item_no" int,
  "cust_name" varchar(60),
  "remark" TEXT,
  "other_info" text,
  "print_flag" char(1) DEFAULT 'N',
  "print_count" int,
  "del_flag" char(1) NOT NULL DEFAULT 'N',
  "del_time" datetime DEFAULT NULL,
  PRIMARY KEY ("order_no", "item_no", "data_type")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.order_coupon_data 結構
DROP TABLE IF EXISTS "order_coupon_data";
CREATE TABLE IF NOT EXISTS "order_coupon_data" (
  "order_no" varchar(20) NOT NULL,
  "item_no" int NOT NULL,
  "external_id" varchar(100),
  "coupon_issuer" varchar(20),
  "coupon_mode" varchar(50),
  "coupon_code" varchar(100),
  "coupon_name" varchar(100),
  "coupon_quantity" integer DEFAULT 0,
  "coupon_val" decimal DEFAULT 0,
  "coupon_amount" decimal(10,2),
  "original" text,
  "del_flag" char(1) DEFAULT 'N',
  "del_time" int,
  "created_time" timestamp,
  "updated_time" timestamp,
  PRIMARY KEY ("order_no", "item_no")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.order_data 結構
DROP TABLE IF EXISTS "order_data";
CREATE TABLE IF NOT EXISTS "order_data" (
  "order_no" varchar(20) NOT NULL,
  "order_no_from" char(1) NOT NULL,
  "order_time" datetime NOT NULL,
  "order_type" int NOT NULL,
  "order_type_name" varchar(50),
  "order_type_code" varchar(30),
  "order_open_time" datetime,
  "order_state" int DEFAULT 0,
  "order_mode" char(1) DEFAULT 'L',
  "terminal_sid" varchar(20) NOT NULL,
  "pos_no" varchar(20),
  "class_sid" int NOT NULL,
  "class_name" varchar(20),
  "user_sid" int NOT NULL,
  "employee_no" varchar(20),
  "table_code" varchar(10),
  "table_name" varchar(10),
  "meal_num" varchar(20),
  "call_num" varchar(10),
  "guests_num" int DEFAULT 0,
  "member_flag" char(1) DEFAULT 'N',
  "member_platform" varchar(30),
  "member_no" varchar(60),
  "member_name" varchar(60),
  "member_phone" varchar(30),
  "member_info" text,
  "takeaways_order_sid" varchar(64),
  "takeaways_order_info" text,
  "takeaways_can_modify" char DEFAULT 'N',
  "outside_order_no" varchar(60),
  "outside_description" text,
  "delivery_city_name" varchar(20),
  "delivery_district_name" varchar(20),
  "delivery_address" varchar(100),
  "item_count" decimal(10,2) DEFAULT 0,
  "subtotal" decimal(10,2) DEFAULT 0,
  "discount_fee" decimal(10,2) DEFAULT 0,
  "promotion_fee" decimal(10,2),
  "promotion_value" text,
  "promotion_pause" char DEFAULT 'N',
  "coupon_discount" decimal(10,2),
  "coupon_value" text,
  "stock_push_quantity" int DEFAULT 0,
  "stock_push_amount" decimal(10,2) DEFAULT 0,
  "stock_pull_quantity" int DEFAULT 0,
  "stock_pull_amount" decimal(10,2) DEFAULT 0,
  "service_rate" decimal(10,2) DEFAULT 0,
  "service_fee" decimal(10,2) DEFAULT 0,
  "service_calc_param" text,
  "service_fee_pause" char DEFAULT 'N',
  "trans_reversal" decimal(10,2) DEFAULT 0,
  "over_paid" decimal(10,2) DEFAULT 0,
  "tax_fee" decimal(10,2) DEFAULT 0,
  "amount" decimal(10,2) DEFAULT 0,
  "paid_type_sid" int,
  "paid_flag" char(1) DEFAULT 'N',
  "paid_time" datetime DEFAULT NULL,
  "paid_info" text,
  "cash_fee" decimal(10,2) DEFAULT 0,
  "change_fee" decimal(10,2) DEFAULT 0,
  "invoice_flag" char(1) DEFAULT 'N',
  "invoice_info" text,
  "cust_ein" varchar(8),
  "cancel_flag" char(1) DEFAULT 'N',
  "cancel_time" datetime DEFAULT NULL,
  "cancel_class_sid" int,
  "cancel_class_name" varchar(20),
  "cash_refund_flag" char DEFAULT 'N',
  "refund" decimal(10,2),
  "refund_type_sid" int,
  "cancel_upload_flag" char(1) DEFAULT 'N',
  "cancel_upload_time" datetime,
  "del_flag" char(1) DEFAULT 'N',
  "business_day" datetime,
  "class_close_flag" char(1) DEFAULT 'N',
  "class_report_no" varchar(20),
  "daily_close_flag" char(1) DEFAULT 'N',
  "daily_report_no" varchar(20),
  "order_temp_info" text,
  "remarks" TEXT,
  "upload_flag" char(1) DEFAULT 'N',
  "upload_time" datetime DEFAULT NULL,
  "created_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp DEFAULT CURRENT_TIMESTAMP, delivery_fee decimal(10, 2)  DEFAULT 0, import_source varchar(30)  DEFAULT '',
  PRIMARY KEY ("order_no")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.order_invoice_data 結構
DROP TABLE IF EXISTS "order_invoice_data";
CREATE TABLE IF NOT EXISTS "order_invoice_data" (
  "order_no" varchar(20) NOT NULL,
  "inv_period" char(6) NOT NULL,
  "inv_no" char(10) NOT NULL,
  "cust_ein" varchar(8),
  "donate_flag" char(1) DEFAULT 'N',
  "donate_code" varchar(20),
  "carrier_type" varchar(20),
  "carrier_code_1" varchar(64),
  "carrier_code_2" varchar(64),
  "batch_num" int NOT NULL,
  "random_code" char(4) NOT NULL,
  "qrcode_aes_key" varchar(32),
  PRIMARY KEY ("order_no", "inv_period", "inv_no")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.order_payment_data 結構
DROP TABLE IF EXISTS "order_payment_data";
CREATE TABLE IF NOT EXISTS order_payment_data
(
   order_no             varchar(20) not null,
   item_no              int not null default 0,
   payment_sid          int,
   payment_code         varchar(30) not null,
   payment_name         varchar(30),
   payment_module_code  varchar(30),
   payment_module_params text,
   coupon_discount      decimal(10,2) default 0,
   amount               decimal(10,2) not null,
   received_fee         decimal(10,2) default 0,
   change_fee           decimal(10,2) default 0,
   payment_time         datetime,
   payment_info         text,
   refund_flag          char(1) default 'N',
   refund_time          datetime,
   refund_info          text,
   del_flag             char(1) default 'N',
   del_time             datetime,
   created_time         timestamp default CURRENT_TIMESTAMP,
   updated_time         timestamp,
   primary key (order_no, item_no)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.order_type_data 結構
DROP TABLE IF EXISTS "order_type_data";
CREATE TABLE IF NOT EXISTS "order_type_data" (
  "SID" int NOT NULL,
  "price_type_sid" int NOT NULL,
  "type_name" varchar(10) NOT NULL,
  "order_type_code" varchar(30),
  "payment_def" int DEFAULT 0,
  "def_payment_code" varchar(20),
  "invoice_state" int NOT NULL DEFAULT 0,
  "display_state" char(1) NOT NULL DEFAULT 'Y',
  "params" TEXT,
  "sort" int,
  "stop_flag" char(1) DEFAULT 'N',
  "stop_time" datetime DEFAULT NULL,
  "del_flag" char(1) DEFAULT 'N',
  "del_time" datetime DEFAULT NULL,
  "created_time" timestamp,
  "updated_time" timestamp,
  PRIMARY KEY ("SID", "price_type_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.packaging_data 結構
DROP TABLE IF EXISTS "packaging_data";
CREATE TABLE IF NOT EXISTS packaging_data
(
   SID                  int(11) not null,
   packaging_type_sid   int(11) not null,
   code                 varchar(30),
   name                 varchar(30),
   price                decimal(10,2) default 0,
   memo                 varchar(50),
   sort                 int(11) default 0,
   del_flag             char(1),
   del_time             datetime default NULL,
   created_time         timestamp ,
   updated_time         timestamp ,
   primary key (SID)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.packaging_type 結構
DROP TABLE IF EXISTS "packaging_type";
CREATE TABLE IF NOT EXISTS packaging_type
(
   SID                  int(11) not null,
   name                 varchar(20) not null,
   sort                 int(3) default 0,
   show_flag            char(1),
   required_flag        char(1),
   del_flag             char(1),
   del_time             datetime default NULL,
   created_time         timestamp ,
   updated_time         timestamp ,
   primary key (SID)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.param_data 結構
DROP TABLE IF EXISTS "param_data";
CREATE TABLE IF NOT EXISTS "param_data" (
  "terminal_sid" varcahr(30) NOT NULL,
  "terminal_server_flag" char(1) DEFAULT 'N',
  "terminal_server_port" int DEFAULT 0,
  "order_no_from" char(1),
  "serial_server_name" varchar(40),
  "serial_server_port" int DEFAULT 0,
  "print_server_name" varchar(40),
  "print_server_port" int DEFAULT 0,
  "created_time" datetime DEFAULT CURRENT_TIMESTAMP,
  "updated_time" datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("terminal_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.payment_module 結構
DROP TABLE IF EXISTS "payment_module";
CREATE TABLE IF NOT EXISTS "payment_module" (
  "payment_module_code" varchar(50) NOT NULL,
  "payment_module_name" varchar(50),
  "def_params" text,
  "active_state" char(1) NOT NULL DEFAULT 'N',
  "created_time" timestamp,
  "updated_time" timestamp,
  PRIMARY KEY ("payment_module_code")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.payment_module_params 結構
DROP TABLE IF EXISTS "payment_module_params";
CREATE TABLE IF NOT EXISTS payment_module_params
(
   SID                  int not null,
   payment_module_code  varchar(50) not null,
   params               text,
   del_flag             char(1) default 'N',
   del_time             datetime,
   stop_flag            char(1) default 'N',
   stop_time            datetime,
   sort                 int default 0,
   created_time         timestamp,
   updated_time         timestamp,
   primary key (SID)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.payment_type 結構
DROP TABLE IF EXISTS "payment_type";
CREATE TABLE IF NOT EXISTS "payment_type" (
	"SID"	int NOT NULL,
	"payment_code"	varchar(20) NOT NULL,
	"payment_name"	varchar(30) NOT NULL,
	"created_time"	timestamp NOT NULL,
	"updated_time"	timestamp NOT NULL,
	PRIMARY KEY("SID")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.price_type 結構
DROP TABLE IF EXISTS "price_type";
CREATE TABLE IF NOT EXISTS "price_type" (
  "price_type_sid" int NOT NULL,
  "company_sid" int NOT NULL,
  "price_type_name" char(10) NOT NULL,
  "del_flag" char(1) NOT NULL DEFAULT 'N',
  "del_time" datetime DEFAULT NULL,
  "stop_flag" char(1) NOT NULL DEFAULT 'N',
  "stop_time" datetime DEFAULT NULL,
  "created_time" timestamp,
  "updated_time" timestamp,
  PRIMARY KEY ("company_sid", "price_type_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.printer_config 結構
DROP TABLE IF EXISTS "printer_config";
CREATE TABLE IF NOT EXISTS printer_config
(
   printer_sid          int not null,
   param_value          text,
   created_time         timestamp,
   updated_time         timestamp,
   primary key (printer_sid)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.printer_data 結構
DROP TABLE IF EXISTS "printer_data";
CREATE TABLE IF NOT EXISTS printer_data
(
   SID                  int not null,
   printer_code         varchar(50) not null,
   printer_name         varchar(50) not null,
   output_type          char(1) not null,
   stop_flag            char(1) default 'N',
   stop_time            datetime,
   del_flag             char(1) default 'N',
   del_time             datetime,
   created_time         timestamp,
   updated_time         timestamp, template_type varchar(20)  DEFAULT null, template_sid varchar(64)  DEFAULT null,
   primary key (SID)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.printer_group_data 結構
DROP TABLE IF EXISTS "printer_group_data";
CREATE TABLE IF NOT EXISTS "printer_group_data" (
  "SID" int NOT NULL,
  "printer_group_name" varchar NOT NULL,
  "printer_sid" int NOT NULL,
  "order_type_sid" int DEFAULT 0,
  "filter_type" varchar,
  "params" TEXT,
  "stop_flag" char DEFAULT 'N',
  "stop_time" datetime,
  "del_flag" char(1) DEFAULT 'N',
  "del_time" datetime,
  "created_time" timestamp,
  "updated_time" timestamp,
  PRIMARY KEY ("SID")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.printer_group_order_type_relation 結構
DROP TABLE IF EXISTS "printer_group_order_type_relation";
CREATE TABLE IF NOT EXISTS printer_group_order_type_relation
(
   printer_group_sid    int not null,
   order_type_sid       int not null,
   primary key (printer_group_sid, order_type_sid)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.printer_group_relation 結構
DROP TABLE IF EXISTS "printer_group_relation";
CREATE TABLE IF NOT EXISTS printer_group_relation
(
   printer_group_sid    int not null,
   product_sid          int not null,
   primary key (printer_group_sid, product_sid)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.printer_template 結構
DROP TABLE IF EXISTS "printer_template";
CREATE TABLE IF NOT EXISTS "printer_template" (
	"SID"	varchar(64) NOT NULL,
	"template_name"	varchar(50) NOT NULL,
	"template_value"	text,
	"template_type"	varchar(20) NOT NULL,
	"include_command"	char(1) DEFAULT 'N',
	"created_time"	timestamp,
	"updated_time"	timestamp,
	PRIMARY KEY("SID")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.product_category 結構
DROP TABLE IF EXISTS "product_category";
CREATE TABLE IF NOT EXISTS "product_category" (
  "SID" int NOT NULL,
  "company_sid" int NOT NULL,
  "category_code" varchar(50),
  "category_name" varchar(20) NOT NULL,
  "sort" int(3) NOT NULL DEFAULT 0,
  "display_flag" char DEFAULT 'Y',
  "stop_flag" char(1) DEFAULT 'N',
  "stop_time" datetime DEFAULT NULL,
  "del_flag" char(1) NOT NULL DEFAULT 'N',
  "del_time" timestamp NOT NULL DEFAULT '0000-00-00',
  "created_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("SID", "company_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.product_category_relation 結構
DROP TABLE IF EXISTS "product_category_relation";
CREATE TABLE IF NOT EXISTS "product_category_relation" (
  "category_sid" int NOT NULL,
  "product_sid" int NOT NULL,
  PRIMARY KEY ("category_sid", "product_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.product_condiment_relation 結構
DROP TABLE IF EXISTS "product_condiment_relation";
CREATE TABLE IF NOT EXISTS "product_condiment_relation" (
  "product_sid" int NOT NULL,
  "condiment_sid" int NOT NULL,
  PRIMARY KEY ("product_sid", "condiment_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.product_data 結構
DROP TABLE IF EXISTS "product_data";
CREATE TABLE IF NOT EXISTS "product_data" (
  "SID" int NOT NULL,
  "company_sid" int NOT NULL,
  "product_code" varchar(50) NOT NULL,
  "barcode" varchar(100),
  "product_name" varchar(50) NOT NULL,
  "product_shortname" varchar(40),
  "product_type" char(10),
  "price_mode" char(1) DEFAULT 'F',
  "product_price" decimal(10,2),
  "unit_sid" int NOT NULL,
  "tax_sid" int,
  "sort" int NOT NULL DEFAULT 0,
  "memo" text,
  "display_flag" char DEFAULT 'Y',
  "pause_flag" char DEFAULT 'N',
  "pause_time" datetime,
  "stop_flag" char(1) NOT NULL DEFAULT 'N',
  "stop_time" datetime NOT NULL,
  "del_flag" char(1) NOT NULL DEFAULT 'N',
  "del_time" datetime NOT NULL,
  "price_update_time" datetime,
  "category_update_time" datetime DEFAULT NULL,
  "condiment_update_time" datetime DEFAULT NULL,
  "promotion_update_time" datetime,
  "spec_update_time" datetime,
  "created_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("SID", "company_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.product_price_type_relation 結構
DROP TABLE IF EXISTS "product_price_type_relation";
CREATE TABLE IF NOT EXISTS "product_price_type_relation" (
  "product_sid" int NOT NULL,
  "price_type_sid" int NOT NULL,
  "price" decimal(10,2) NOT NULL,
  "created_time" timestamp,
  "updated_time" timestamp,
  PRIMARY KEY ("product_sid", "price_type_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.product_promotion_relation 結構
DROP TABLE IF EXISTS "product_promotion_relation";
CREATE TABLE IF NOT EXISTS "product_promotion_relation" (
  "product_sid" int NOT NULL,
  "promotion_sid" int NOT NULL,
  PRIMARY KEY ("product_sid", "promotion_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.product_set_relation 結構
DROP TABLE IF EXISTS "product_set_relation";
CREATE TABLE IF NOT EXISTS product_set_relation
(
   set_sid              int not null,
   attribute_sid        int not null,
   category_sid         int not null,
   product_sid          int not null,
   main_flag            char(1) not null,
   default_flag         char(1) not null,
   primary key (set_sid, product_sid, category_sid, attribute_sid)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.product_spec_data 結構
DROP TABLE IF EXISTS "product_spec_data";
CREATE TABLE IF NOT EXISTS product_spec_data
(
   SID                  int not null,
   spec_name            varchar(50) not null,
   init_product_sid     int,
   del_flag             char(1) not null default 'N',
   del_time             datetime,
   created_time         timestamp not null,
   updated_time         timestamp not null,
   primary key (SID)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.product_spec_relation 結構
DROP TABLE IF EXISTS "product_spec_relation";
CREATE TABLE IF NOT EXISTS product_spec_relation
(
   spec_sid             int not null,
   product_sid          int not null,
   alias_name           varchar(50),
   sort                 int,
   primary key (spec_sid, product_sid)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.product_unit 結構
DROP TABLE IF EXISTS "product_unit";
CREATE TABLE IF NOT EXISTS "product_unit" (
  "SID" int NOT NULL,
  "company_sid" int NOT NULL,
  "unit_name" varchar(10) NOT NULL,
  "sort" int(3) NOT NULL DEFAULT 0,
  "del_flag" char(1) NOT NULL DEFAULT 'N',
  "del_time" timestamp NOT NULL DEFAULT '0000-00-00',
  "created_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("SID", "company_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.promotion_data 結構
DROP TABLE IF EXISTS "promotion_data";
CREATE TABLE IF NOT EXISTS "promotion_data" (
  "SID" int NOT NULL,
  "company_sid" int NOT NULL,
  "promotion_name" varchar(30) NOT NULL,
  "promotion_start_time" datetime,
  "promotion_end_time" datetime,
  "promotion_sort" int NOT NULL DEFAULT 0,
  "coexist_flag" char(1) NOT NULL,
  "promotion_type" char(1) NOT NULL,
  "promotion_data" text NOT NULL,
  "stop_flag" char(1) NOT NULL DEFAULT 'N',
  "stop_time" datetime DEFAULT NULL,
  "del_flag" char(1) NOT NULL DEFAULT 'N',
  "del_time" datetime DEFAULT NULL,
  "created_time" timestamp,
  "updated_time" timestamp,
  PRIMARY KEY ("SID", "company_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.promotion_order_type_relation 結構
DROP TABLE IF EXISTS "promotion_order_type_relation";
CREATE TABLE IF NOT EXISTS promotion_order_type_relation
(
   promotion_sid        int not null,
   order_type_sid       int not null,
   primary key (promotion_sid, order_type_sid)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.role_data 結構
DROP TABLE IF EXISTS "role_data";
CREATE TABLE IF NOT EXISTS "role_data" (
  "SID" int NOT NULL,
  "role_name" varchar(20) NOT NULL,
  "del_flag" char(1) NOT NULL DEFAULT 'N',
  "del_time" datetime DEFAULT NULL,
  "created_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("SID")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.role_func 結構
DROP TABLE IF EXISTS "role_func";
CREATE TABLE IF NOT EXISTS "role_func" (
  "role_sid" int NOT NULL,
  "func_sid" varchar(50) NOT NULL,
  PRIMARY KEY ("role_sid", "func_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.serial_code_data 結構
DROP TABLE IF EXISTS "serial_code_data";
CREATE TABLE IF NOT EXISTS "serial_code_data" (
  "serial_type" varchar(30) NOT NULL,
  "serial_name" varchar(30),
  "code_first_char" varchar(20),
  "code_split_char" chae(1),
  "code_num_len" int NOT NULL DEFAULT 5,
  "code_str" varchar(20),
  "code_num" int DEFAULT 0,
  "serial_owner" varchar(32),
  "updated_time" timestamp,
  PRIMARY KEY ("serial_type")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.set_attribute_data 結構
DROP TABLE IF EXISTS "set_attribute_data";
CREATE TABLE IF NOT EXISTS set_attribute_data
(
   SID                  int not null,
   set_sid              int not null,
   attribute_name       varchar(50) not null,
   main_price_type      char(1) not null,
   main_price           decimal(10,2) not null default 0,
   main_max_price       decimal(10,2) default 0,
   sub_price_type       char(1) not null,
   sub_price            decimal(10,2) not null default 0,
   sub_max_price        decimal(10,2) default 0,
   required_flag        char(1) not null default 'N',
   limit_count          int not null default 0,
   repeat_flag          char(1) not null,
   sort                 int not null default 0,
   created_time         timestamp not null,
   updated_time         timestamp not null default CURRENT_TIMESTAMP,
   primary key (SID, set_sid)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.store_table_data 結構
DROP TABLE IF EXISTS "store_table_data";
CREATE TABLE IF NOT EXISTS store_table_data
(
   SID                  int not null,
   table_code           varchar(20),
   table_name           varchar(30),
   table_capacity       int(2),
   table_sort           int,
   stop_flag            char(1) not null default 'N',
   stop_time            datetime,
   del_flag             char(1) not null default 'N',
   del_time             datetime,
   created_time         timestamp,
   updated_time         timestamp,
   primary key (SID)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.takeaways_params 結構
DROP TABLE IF EXISTS "takeaways_params";
CREATE TABLE IF NOT EXISTS takeaways_params
(
   platform_sid         varchar(15) not null,
   active_state         char(1) not null default 'N',
   params               text,
   created_time         timestamp,
   updated_time         timestamp,
   primary key (platform_sid)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.takeaways_platform 結構
DROP TABLE IF EXISTS "takeaways_platform";
CREATE TABLE IF NOT EXISTS takeaways_platform
(
   SID                  varchar(15) not null,
   platform_name        varchar(20),
   created_time         timestamp,
   updated_time         timestamp,
   primary key (SID)
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.tax_data 結構
DROP TABLE IF EXISTS "tax_data";
CREATE TABLE IF NOT EXISTS "tax_data" (
  "SID" int NOT NULL,
  "company_sid" int NOT NULL,
  "tax_name" varchar(20) NOT NULL,
  "tax_rate" decimal(5,2),
  "tax_type" char(1),
  "del_flag" char(1) NOT NULL DEFAULT 'N',
  "del_time" timestamp NOT NULL DEFAULT '0000-00-00',
  "created_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("SID", "company_sid")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.terminal_data 結構
DROP TABLE IF EXISTS "terminal_data";
CREATE TABLE IF NOT EXISTS "terminal_data" (
  "SID" varchar(20) NOT NULL,
  "company_sid" int NOT NULL,
  "terminal_name" varchar(20) NOT NULL,
  "pos_no" varchar(20),
  "pid" varchar(20),
  "rid" varchar(50),
  "app_version" varchar(20),
  "reg_flag" char(1) NOT NULL DEFAULT 'N',
  "reg_submit_time" datetime DEFAULT '0000-00-00',
  "reg_accept_time" datetime DEFAULT '0000-00-00',
  "api_token_id" varchar(64),
  "client_id" varchar(64),
  "client_secret" varchar(64),
  "now_class_sid" int DEFAULT 0,
  "petty_cash" decimal(10,2) DEFAULT 0,
  "business_day" datetime,
  "business_close_time" datetime,
  "invoice_flag" char(1) DEFAULT 'N',
  "invoice_batch_num" INT DEFAULT 0,
  "invoice_active_state" char(1) DEFAULT 'N',
  "last_order_no" varchar(20),
  "use_call_num" integer DEFAULT 0,
  "use_call_date" char(8),
  "online_time" datetime DEFAULT '0000-00-00',
  "keyhook_enable" char(1) DEFAULT 'N',
  "print_run_sync" char DEFAULT 'N',
  "params" TEXT,
  "last_check_update_time" datetime DEFAULT NULL,
  "last_class_report_no" varchar(30),
  "last_daily_report_no" varchar(30),
  PRIMARY KEY ("SID")
);

-- 取消選取資料匯出。

-- 傾印  資料表 vpos.user_data 結構
DROP TABLE IF EXISTS "user_data";
CREATE TABLE IF NOT EXISTS "user_data" (
  "SID" int NOT NULL,
  "company_sid" int NOT NULL,
  "role_sid" int NOT NULL,
  "user_account" varchar(20) NOT NULL,
  "user_pwd" varchar(64) NOT NULL,
  "user_name" varchar(50) NOT NULL,
  "employee_no" varchar(10),
  "job_title" varchar(20),
  "tel" varchar(25),
  "cellphone" varchar(15),
  "state_flag" char(1) NOT NULL DEFAULT 'N',
  "state_time" datetime DEFAULT '0000-00-00',
  "del_flag" char(1) NOT NULL DEFAULT 'N',
  "del_time" datetime DEFAULT '0000-00-00',
  "created_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("SID")
);

-- 取消選取資料匯出。

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
