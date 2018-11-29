package com.uucastle.entity.file;

import com.uucastle.entity.base.BaseEntity;
import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * 文件表
 */
@Alias("BaseFile")
public class File extends BaseEntity{
	
	private static final long serialVersionUID = 1L;

	private String fileId;
	private String fileNo;
	private String fileProp;
	private String fileName;
	private String itemName;
	private String barcode;
	private String orgId;
	private String orgName;
	private String inputTime;
	private String description;
	private Integer isValid;
	private Date createTime;
	private Date updateTime;
	private String beginTime;
	private String endTime;
	private String srcDir;
	private String destDir;

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getFileNo() {
		return fileNo;
	}

	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileProp() {
		return fileProp;
	}

	public void setFileProp(String fileProp) {
		this.fileProp = fileProp;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
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

	public String getInputTime() {
		return inputTime;
	}

	public void setInputTime(String inputTime) {
		this.inputTime = inputTime;
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

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getSrcDir() {
		return srcDir;
	}

	public void setSrcDir(String srcDir) {
		this.srcDir = srcDir;
	}

	public String getDestDir() {
		return destDir;
	}

	public void setDestDir(String destDir) {
		this.destDir = destDir;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		File file = (File) o;

		if (fileId != null ? !fileId.equals(file.fileId) : file.fileId != null) return false;
		if (fileNo != null ? !fileNo.equals(file.fileNo) : file.fileNo != null) return false;
		if (fileProp != null ? !fileProp.equals(file.fileProp) : file.fileProp != null) return false;
		if (fileName != null ? !fileName.equals(file.fileName) : file.fileName != null) return false;
		if (itemName != null ? !itemName.equals(file.itemName) : file.itemName != null) return false;
		if (barcode != null ? !barcode.equals(file.barcode) : file.barcode != null) return false;
		if (orgId != null ? !orgId.equals(file.orgId) : file.orgId != null) return false;
		if (orgName != null ? !orgName.equals(file.orgName) : file.orgName != null) return false;
		if (inputTime != null ? !inputTime.equals(file.inputTime) : file.inputTime != null) return false;
		if (description != null ? !description.equals(file.description) : file.description != null) return false;
		if (isValid != null ? !isValid.equals(file.isValid) : file.isValid != null) return false;
		if (createTime != null ? !createTime.equals(file.createTime) : file.createTime != null) return false;
		if (updateTime != null ? !updateTime.equals(file.updateTime) : file.updateTime != null) return false;
		if (beginTime != null ? !beginTime.equals(file.beginTime) : file.beginTime != null) return false;
		if (endTime != null ? !endTime.equals(file.endTime) : file.endTime != null) return false;
		if (srcDir != null ? !srcDir.equals(file.srcDir) : file.srcDir != null) return false;
		return !(destDir != null ? !destDir.equals(file.destDir) : file.destDir != null);

	}

	@Override
	public int hashCode() {
		int result = fileId != null ? fileId.hashCode() : 0;
		result = 31 * result + (fileNo != null ? fileNo.hashCode() : 0);
		result = 31 * result + (fileProp != null ? fileProp.hashCode() : 0);
		result = 31 * result + (fileName != null ? fileName.hashCode() : 0);
		result = 31 * result + (itemName != null ? itemName.hashCode() : 0);
		result = 31 * result + (barcode != null ? barcode.hashCode() : 0);
		result = 31 * result + (orgId != null ? orgId.hashCode() : 0);
		result = 31 * result + (orgName != null ? orgName.hashCode() : 0);
		result = 31 * result + (inputTime != null ? inputTime.hashCode() : 0);
		result = 31 * result + (description != null ? description.hashCode() : 0);
		result = 31 * result + (isValid != null ? isValid.hashCode() : 0);
		result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
		result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
		result = 31 * result + (beginTime != null ? beginTime.hashCode() : 0);
		result = 31 * result + (endTime != null ? endTime.hashCode() : 0);
		result = 31 * result + (srcDir != null ? srcDir.hashCode() : 0);
		result = 31 * result + (destDir != null ? destDir.hashCode() : 0);
		return result;
	}

	@Override
	public String toString() {
		return "File{" +
				"fileId='" + fileId + '\'' +
				", fileNo='" + fileNo + '\'' +
				", fileProp='" + fileProp + '\'' +
				", fileName='" + fileName + '\'' +
				", itemName='" + itemName + '\'' +
				", barcode='" + barcode + '\'' +
				", orgId='" + orgId + '\'' +
				", orgName='" + orgName + '\'' +
				", inputTime='" + inputTime + '\'' +
				", description='" + description + '\'' +
				", isValid=" + isValid +
				", createTime=" + createTime +
				", updateTime=" + updateTime +
				", beginTime='" + beginTime + '\'' +
				", endTime='" + endTime + '\'' +
				", srcDir='" + srcDir + '\'' +
				", destDir='" + destDir + '\'' +
				'}';
	}
}