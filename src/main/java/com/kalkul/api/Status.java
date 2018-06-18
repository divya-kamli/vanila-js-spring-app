package com.kalkul.api;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public enum Status {
    SUCCESS,
    FAILED,
    REJECTED
}
