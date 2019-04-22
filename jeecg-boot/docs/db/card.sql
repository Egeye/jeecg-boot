
DROP TABLE IF EXISTS `tb_card_flow`;
CREATE TABLE tb_card_flow (
  `id`           INT      AUTO_INCREMENT COMMENT 'ID',
  `iccid`         VARCHAR(50) COMMENT '卡号',
  `combo_name`    VARCHAR(100) COMMENT '套餐名',
  `used`          DECIMAL COMMENT '已使用',
  `left`          DECIMAL COMMENT '剩余',
  `total`        DECIMAL COMMENT '总流量',
  `combo_date`   DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='卡流量表';


DROP TABLE IF EXISTS `tb_card_log`;
CREATE TABLE tb_card_log (
  `id`            INT      AUTO_INCREMENT COMMENT 'ID',
  `begin_id`      INT COMMENT '开始ID',
  `end_id`        INT COMMENT '结束ID',
  `operate_customer_id` INT COMMENT '操作客户',
  `type`          VARCHAR(50)  COMMENT '卡操作类型 停机 复机 取消测试期 续期 变更套餐 停机',
  `status`        INT COMMENT '0=完成 1=操作中',
  `create_time`   DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='卡操作记录';


DROP TABLE IF EXISTS `tb_card`;
CREATE TABLE tb_card (
  `id`           INT      AUTO_INCREMENT COMMENT 'ID',
  `iccid`         VARCHAR(50) COMMENT '卡号',
  `channel_code`     VARCHAR(50) COMMENT '通道',
  `pool_code` VARCHAR(50) COMMENT '流量池',
  `combo_code`      VARCHAR(50) COMMENT '套餐',
  `customer_id`       INT COMMENT '客户',
  `card_log_id`       INT COMMENT '卡操作日志ID',
  `period`         VARCHAR(200) COMMENT '生命期 测试期 沉默期 正式期 其他',
  `real_period`       VARCHAR(200) COMMENT '生命期 测试期 沉默期 正式期 其他',
  `close_status`       INT COMMENT '是否主动停机 1=主动停机 0=未主动停机',
  `create_time`  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '开户时间',
  `active_time`  DATETIME DEFAULT NULL COMMENT '激活时间',
  `close_time`  DATETIME DEFAULT NULL COMMENT '停机时间',
  `open_time`  DATETIME DEFAULT NULL COMMENT '复机时间',
  `enter_time`  DATETIME DEFAULT NULL COMMENT '客户卡入库时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='卡信息表';


DROP TABLE IF EXISTS `tb_card_order`;
CREATE TABLE tb_card_order (
  `id`           INT      AUTO_INCREMENT COMMENT 'ID',
  `order_no`         VARCHAR(50) COMMENT '订单号',
  `customer_id` INT COMMENT '客户',
  `sale_customer_id`     INT COMMENT '销售客户',
  `channel_code`      VARCHAR(50) COMMENT '通道',
  `combo_code`        VARCHAR(50) COMMENT '套餐',
  `combo_cost`         DECIMAL COMMENT '套餐COST',
  `combo_price`      DECIMAL COMMENT '套餐单价',
  `card_num`       INT COMMENT '卡数量',
  `amount`       DECIMAL COMMENT '总价',
  `profit`       DECIMAL COMMENT '利润',
  `type`       INT COMMENT '订单类型',
  `create_time`  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='卡订单表';


DROP TABLE IF EXISTS `tb_card_task`;
CREATE TABLE tb_card_task (
  `id`           INT      AUTO_INCREMENT COMMENT 'ID',
  `type`         VARCHAR(50) COMMENT '类型',
  `begin_time`  DATETIME DEFAULT NULL COMMENT '开始日期',
  `end_time`  DATETIME DEFAULT NULL COMMENT '结束日期',
  `status`       INT COMMENT '状态 0成功 =1失败',
  `create_time`  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='卡任务表';


DROP TABLE IF EXISTS `tb_channel`;
CREATE TABLE tb_channel (
  `id`          INT      AUTO_INCREMENT COMMENT 'ID',
  `name`        VARCHAR(50) UNIQUE COMMENT '通道名',
  `channle_no`  VARCHAR(50) UNIQUE COMMENT '通道编码',
  `operator`    VARCHAR(5) COMMENT '运营商',
  `balance`     DECIMAL COMMENT '通道余额',
  `status`      INT COMMENT '通道状态 0 停用 1 启用',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='通道表';


DROP TABLE IF EXISTS `tb_combo`;
CREATE TABLE tb_combo (
  `id`           INT      AUTO_INCREMENT COMMENT 'ID',
  `size`         INT COMMENT '套餐大小 单位M',
  `combo_no`      VARCHAR(50) COMMENT '套餐编号',
  `channel_no` VARCHAR(50) COMMENT '所属通道编码',
  `combo_name`      VARCHAR(200) COMMENT '套餐名',
  `type`        VARCHAR(50) COMMENT '套餐类型:套餐 package和 叠加包 assist',
  `assist_type`         VARCHAR(50) COMMENT '叠加包类型',
  `channel_combo_id`       VARCHAR(50) COMMENT '通道产品id',
  `create_time`  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time`  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='套餐表';



DROP TABLE IF EXISTS `tb_combo_rate`;
CREATE TABLE tb_combo_rate (
`id`           INT      AUTO_INCREMENT COMMENT 'ID',
`combo_no`      VARCHAR(50) COMMENT '套餐编号',
  `customer_id`   INT COMMENT '客户',
  `sale_price`      DECIMAL COMMENT '价格',
  `create_time`  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time`  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='套餐价格表';



DROP TABLE IF EXISTS `tb_customer_fund`;
CREATE TABLE tb_customer_fund (
  `id`           INT      AUTO_INCREMENT COMMENT 'ID',
  `amount`        DECIMAL COMMENT '总价',
  `type`      INT COMMENT '通道流水类型 1=充值 2=扣款',
  `customer_id` INT COMMENT '客户',
  `remark`      VARCHAR(4000) COMMENT '备注',
  `create_time`  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='客户资金表';



DROP TABLE IF EXISTS `tb_enter_store`;
CREATE TABLE tb_enter_store (
  `id`           INT      AUTO_INCREMENT COMMENT 'ID',
  `card_num`         INT COMMENT '卡号',
  `begin_id`      INT COMMENT '开始ID',
  `end_id`      INT COMMENT '结束ID',
  `channel_code`      VARCHAR(200) COMMENT '通道',
  `combo_code`        VARCHAR(200) COMMENT '套餐',
  `customer_id`        INT COMMENT '客户',
  `create_time`  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='入库表';



DROP TABLE IF EXISTS `tb_out_store`;
CREATE TABLE tb_out_store (
  `id`           INT      AUTO_INCREMENT COMMENT 'ID',
  `card_num`         INT COMMENT '卡号',
  `begin_id`      INT COMMENT '开始ID',
  `end_id`      INT COMMENT '结束ID',
  `address`      VARCHAR(200) COMMENT '通道',
  `status`        INT COMMENT '发货状态 1=已发货 0=未发货',
  `customer_id`        INT COMMENT '客户',
  `sale_customer_id`        INT COMMENT '客户',
  `create_time`  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='出库表';



DROP TABLE IF EXISTS `tb_pool_flow`;
CREATE TABLE tb_pool_flow (
  `id`           INT      AUTO_INCREMENT COMMENT 'ID',
  `pool_code`         VARCHAR(50) COMMENT '流量池编码',
  `combo_name`    VARCHAR(100) COMMENT '套餐名',
  `used`          DECIMAL COMMENT '已使用',
  `left`          DECIMAL COMMENT '剩余',
  `total`        DECIMAL COMMENT '总流量',
  `combo_date`   DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='流量池使用情况';



DROP TABLE IF EXISTS `tb_pool`;
CREATE TABLE tb_pool (
  `id`           INT      AUTO_INCREMENT COMMENT 'ID',
  `pool_code` VARCHAR(50) COMMENT '流量池',
  `pool_no` VARCHAR(50) COMMENT '流量池卡号',
  `pool_name` VARCHAR(50) COMMENT '流量池名称',
  `channel_code`      VARCHAR(50) COMMENT '通道',
  `combo_code`      VARCHAR(50) COMMENT '套餐',
  `customer_id`       INT COMMENT '客户',
  `create_time`  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '开户时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='流量池';



DROP TABLE IF EXISTS `tb_user_verify`;
CREATE TABLE tb_user_verify (
  `id`           INT      AUTO_INCREMENT COMMENT 'ID',
  `name`         VARCHAR(10) COMMENT '法人姓名',
  `id_card`      VARCHAR(20) COMMENT '法人身份证号',
  `company_name` VARCHAR(50) COMMENT '公司名',
  `user_id`      INT COMMENT '系统用户ID',
  `front`        VARCHAR(200) COMMENT '法人身份证正面',
  `back`         VARCHAR(200) COMMENT '法人身份证反面',
  `permit`       VARCHAR(200) COMMENT '营业执照',
  `status`       INT COMMENT '状态 1:审核中,2,审核通过',
  `create_time`  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time`  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户实名制';