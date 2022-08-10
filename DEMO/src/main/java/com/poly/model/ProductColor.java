package com.poly.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Nationalized;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "product_color")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductColor implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Nationalized
	private String colorName;
	
	private String colorHex;
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Products product;
	
	@OneToMany(mappedBy = "colorId")
	private List<ProductImage> images;
	
}
