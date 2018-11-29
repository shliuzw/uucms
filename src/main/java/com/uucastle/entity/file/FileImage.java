package com.uucastle.entity.file;

import com.uucastle.entity.base.BaseEntity;
import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * 文件表
 */
@Alias("FileImage")
public class FileImage extends BaseEntity{
	
	private static final long serialVersionUID = 1L;

	private String imageId;
	private String fileId;
	private String barcode;
	private String description;
	private Date createTime;
	private Date updateTime;

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getImageId() {
		return imageId;
	}

	public void setImageId(String imageId) {
		this.imageId = imageId;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}



	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

		FileImage fileImage = (FileImage) o;

		if (imageId != null ? !imageId.equals(fileImage.imageId) : fileImage.imageId != null) return false;
		if (fileId != null ? !fileId.equals(fileImage.fileId) : fileImage.fileId != null) return false;
		if (barcode != null ? !barcode.equals(fileImage.barcode) : fileImage.barcode != null) return false;
		if (description != null ? !description.equals(fileImage.description) : fileImage.description != null)
			return false;
		if (createTime != null ? !createTime.equals(fileImage.createTime) : fileImage.createTime != null) return false;
		return !(updateTime != null ? !updateTime.equals(fileImage.updateTime) : fileImage.updateTime != null);

	}

	@Override
	public int hashCode() {
		int result = imageId != null ? imageId.hashCode() : 0;
		result = 31 * result + (fileId != null ? fileId.hashCode() : 0);
		result = 31 * result + (barcode != null ? barcode.hashCode() : 0);
		result = 31 * result + (description != null ? description.hashCode() : 0);
		result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
		result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
		return result;
	}

	@Override
	public String toString() {
		return "FileImage{" +
				"imageId='" + imageId + '\'' +
				", fileId='" + fileId + '\'' +
				", barcode='" + barcode + '\'' +
				", description='" + description + '\'' +
				", createTime=" + createTime +
				", updateTime=" + updateTime +
				'}';
	}
}