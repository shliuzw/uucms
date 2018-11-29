admin/password
sa/password

#文件录入表
DROP TABLE IF EXISTS `jy_base_file`;
CREATE TABLE `jy_base_file` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '文件Id',
  `fileName` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '文件名',
  `barcode` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '条形码',
  `orgId` varchar(32) DEFAULT NULL COMMENT '所属部门(对应jy_base_org的Id)',
  `isValid` int(2) NOT NULL DEFAULT '0' COMMENT '是否有效(1:有效，0:无效)',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#文件录入的图片表
DROP TABLE IF EXISTS `jy_base_file_image`;
CREATE TABLE `jy_base_file_image` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '图片Id',
  `fileId` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '文件id',
  `barcode` varchar(256) CHARACTER SET utf8 NOT NULL COMMENT '图片地址',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#虚拟文件表
DROP TABLE IF EXISTS `jy_base_filevirtual`;
CREATE TABLE `jy_base_filevirtual` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '文件Id',
  `fileName` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '文件名',
  `barcode` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '条形码',
  `orgId` varchar(32) DEFAULT NULL COMMENT '所属部门(对应jy_base_org的Id)',
  `isValid` int(2) NOT NULL DEFAULT '0' COMMENT '是否有效(1:有效，0:无效)',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#虚拟文件跟踪表
DROP TABLE IF EXISTS `jy_base_filevirtual_tracker`;
CREATE TABLE `jy_base_filevirtual_tracker` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '跟踪Id',
  `fileId` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '文件Id',
  `gunNo` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '扫描枪编码',
  `barcode` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '条形码',
  `isValid` int(2) NOT NULL DEFAULT '0' COMMENT '是否有效(1:有效，0:无效)',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#扫描枪配置表
DROP TABLE IF EXISTS `jy_base_scan_gun`;
CREATE TABLE `jy_base_scan_gun` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '扫描枪Id',
  `gunNo` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '扫描枪编码',
  `orgId` varchar(32) DEFAULT NULL COMMENT '所属部门(对应jy_base_org的Id)',
  `isValid` int(2) NOT NULL DEFAULT '0' COMMENT '是否有效(1:有效，0:无效)',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
********************************************************************************
ALTER TABLE jy_base_file add fileNo VARCHAR(32) NOT NULL;
********************2017-02-19************************************************************
ALTER TABLE jy_base_file add fileProp VARCHAR(32) NOT NULL;
ALTER TABLE jy_base_file add inputTime VARCHAR(32) NOT NULL;