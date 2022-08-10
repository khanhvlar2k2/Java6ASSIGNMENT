package com.poly.model;

import java.io.Serializable;

import javax.persistence.Embeddable;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Embeddable
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailId implements Serializable{

	private static final long serialVersionUID = 1L;


	private Integer orderId;
	
	private Integer productId;
	
}
