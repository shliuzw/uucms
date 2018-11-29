package com.uucastle.entity.file;

import com.uucastle.entity.base.BaseEntity;
import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * 文件表
 */
@Alias("BaseScanGun")
public class ScanGun extends BaseEntity{
	
	private static final long serialVersionUID = 1L;

	private String gunId;
	private String gunNo;
	private String orgId;
	private String orgName;
	private String description;
	private Integer isValid;
	private Date createTime;
	private Date updateTime;

	public String getGunId() {
		return gunId;
	}

	public void setGunId(String gunId) {
		this.gunId = gunId;
	}

	public String getGunNo() {
		return gunNo;
	}

	public void setGunNo(String gunNo) {
		this.gunNo = gunNo;
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

		ScanGun scanGun = (ScanGun) o;

		if (gunId != null ? !gunId.equals(scanGun.gunId) : scanGun.gunId != null) return false;
		if (gunNo != null ? !gunNo.equals(scanGun.gunNo) : scanGun.gunNo != null) return false;
		if (orgId != null ? !orgId.equals(scanGun.orgId) : scanGun.orgId != null) return false;
		if (orgName != null ? !orgName.equals(scanGun.orgName) : scanGun.orgName != null) return false;
		if (description != null ? !description.equals(scanGun.description) : scanGun.description != null) return false;
		if (isValid != null ? !isValid.equals(scanGun.isValid) : scanGun.isValid != null) return false;
		if (createTime != null ? !createTime.equals(scanGun.createTime) : scanGun.createTime != null) return false;
		return !(updateTime != null ? !updateTime.equals(scanGun.updateTime) : scanGun.updateTime != null);

	}

	@Override
	public int hashCode() {
		int result = gunId != null ? gunId.hashCode() : 0;
		result = 31 * result + (gunNo != null ? gunNo.hashCode() : 0);
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
		return "ScanGun{" +
				"gunId='" + gunId + '\'' +
				", gunNo='" + gunNo + '\'' +
				", orgId='" + orgId + '\'' +
				", orgName='" + orgName + '\'' +
				", description='" + description + '\'' +
				", isValid=" + isValid +
				", createTime=" + createTime +
				", updateTime=" + updateTime +
				'}';
	}
}