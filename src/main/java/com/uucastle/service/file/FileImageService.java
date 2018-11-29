package com.uucastle.service.file;

import com.uucastle.entity.file.FileImage;
import com.uucastle.service.base.BaseService;

/**
 * Created by spring on 2017/1/4.
 */
public interface FileImageService extends BaseService<FileImage> {
    public void deleteFile(FileImage fileImage);
}
