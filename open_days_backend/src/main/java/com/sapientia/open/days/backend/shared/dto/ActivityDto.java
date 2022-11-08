package com.sapientia.open.days.backend.shared.dto;

import java.io.Serial;
import java.io.Serializable;

@SuppressWarnings("unused")
public class ActivityDto implements Serializable {

	private int id;

	private String name;

	@Serial
	private static final long serialVersionUID = 2606074144175745196L;

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}
}
