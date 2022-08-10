package com.poly.model;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "order_details")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private OrderDetailId id = new OrderDetailId();

	@ManyToOne
	@MapsId("orderId")
	@JoinColumn(name = "order_id")
	private Orders order;

	@ManyToOne
	@MapsId("productId")
	@JoinColumn(name = "product_id")
	private Products product;

	private Integer quantity;

	private Double totalPrice;

	public OrderDetails(Orders order, Products product, Integer quantity, Double totalPrice) {
		super();
		this.order = order;
		this.product = product;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
	}

}
