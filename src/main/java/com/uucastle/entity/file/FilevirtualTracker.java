package com.uucastle.entity.file;

import com.uucastle.entity.base.BaseEntity;
import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * 文件表
 */
@Alias("BaseFilevirtualTracker")
public class FilevirtualTracker extends BaseEntity{
	
	private static final long serialVersionUID = 1L;

	private String trackerId;
	private String fileId;
	private String fileName;
	private String gunNo;
	private String barcode;
	private String orgName;
	private String description;
	private Integer isValid;
	private Date createTime;
	private Date updateTime;

	public String getTrackerId() {
		return trackerId;
	}

	public void setTrackerId(String trackerId) {
		this.trackerId = trackerId;
	}

	public String getGunNo() {
		return gunNo;
	}

	public void setGunNo(String gunNo) {
		this.gunNo = gunNo;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
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

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		FilevirtualTracker that = (FilevirtualTracker) o;

		if (trackerId != null ? !trackerId.equals(that.trackerId) : that.trackerId != null) return false;
		if (fileId != null ? !fileId.equals(that.fileId) : that.fileId != null) return false;
		if (fileName != null ? !fileName.equals(that.fileName) : that.fileName != null) return false;
		if (gunNo != null ? !gunNo.equals(that.gunNo) : that.gunNo != null) return false;
		if (barcode != null ? !barcode.equals(that.barcode) : that.barcode != null) return false;
		if (orgName != null ? !orgName.equals(that.orgName) : that.orgName != null) return false;
		if (description != null ? !description.equals(that.description) : that.description != null) return false;
		if (isValid != null ? !isValid.equals(that.isValid) : that.isValid != null) return false;
		if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;
		return !(updateTime != null ? !updateTime.equals(that.updateTime) : that.updateTime != null);

	}

	@Override
	public int hashCode() {
		int result = trackerId != null ? trackerId.hashCode() : 0;
		result = 31 * result + (fileId != null ? fileId.hashCode() : 0);
		result = 31 * result + (fileName != null ? fileName.hashCode() : 0);
		result = 31 * result + (gunNo != null ? gunNo.hashCode() : 0);
		result = 31 * result + (barcode != null ? barcode.hashCode() : 0);
		result = 31 * result + (orgName != null ? orgName.hashCode() : 0);
		result = 31 * result + (description != null ? description.hashCode() : 0);
		result = 31 * result + (isValid != null ? isValid.hashCode() : 0);
		result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
		result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
		return result;
	}

	@Override
	public String toString() {
		return "FilevirtualTracker{" +
				"trackerId='" + trackerId + '\'' +
				", fileId='" + fileId + '\'' +
				", fileName='" + fileName + '\'' +
				", gunNo='" + gunNo + '\'' +
				", barcode='" + barcode + '\'' +
				", orgName='" + orgName + '\'' +
				", description='" + description + '\'' +
				", isValid=" + isValid +
				", createTime=" + createTime +
				", updateTime=" + updateTime +
				'}';
	}
}