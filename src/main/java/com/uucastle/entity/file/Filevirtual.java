package com.uucastle.entity.file;

import com.uucastle.entity.base.BaseEntity;
import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * 文件表
 */
@Alias("BaseFilevirtual")
public class Filevirtual extends BaseEntity{
	
	private static final long serialVersionUID = 1L;

	private String fileId;
	private String fileName;
	private String barcode;
	private String orgId;
	private String orgName;
	private String description;
	private Integer isValid;
	private Date createTime;
	private Date updateTime;

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getOrgId() {
		return orgId;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getIsValid() {
		return isValid;
	}

	public void setIsValid(Integer isValid) {
		this.isValid = isValid;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		Filevirtual file = (Filevirtual) o;

		if (fileId != null ? !fileId.equals(file.fileId) : file.fileId != null) return false;
		if (fileName != null ? !fileName.equals(file.fileName) : file.fileName != null) return false;
		if (barcode != null ? !barcode.equals(file.barcode) : file.barcode != null) return false;
		if (orgId != null ? !orgId.equals(file.orgId) : file.orgId != null) return false;
		if (orgName != null ? !orgName.equals(file.orgName) : file.orgName != null) return false;
		if (description != null ? !description.equals(file.description) : file.description != null) return false;
		if (isValid != null ? !isValid.equals(file.isValid) : file.isValid != null) return false;
		if (createTime != null ? !createTime.equals(file.createTime) : file.createTime != null) return false;
		return !(updateTime != null ? !updateTime.equals(file.updateTime) : file.updateTime != null);

	}

	@Override
	public int hashCode() {
		int result = fileId != null ? fileId.hashCode() : 0;
		result = 31 * result + (fileName != null ? fileName.hashCode() : 0);
		result = 31 * result + (barcode != null ? barcode.hashCode() : 0);
		result = 31 * result + (orgId != null ? orgId.hashCode() : 0);
		result = 31 * result + (orgName != null ? orgName.hashCode() : 0);
		result = 31 * result + (description != null ? description.hashCode() : 0);
		result = 31 * result + (isValid != null ? isValid.hashCode() : 0);
		result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
		result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
		return result;
	}

	@Override
	public String toString() {
		return "File{" +
				"fileId='" + fileId + '\'' +
				", fileName='" + fileName + '\'' +
				", barcode='" + barcode + '\'' +
				", orgId='" + orgId + '\'' +
				", orgName='" + orgName + '\'' +
				", description='" + description + '\'' +
				", isValid=" + isValid +
				", createTime=" + createTime +
				", updateTime=" + updateTime +
				'}';
	}
}