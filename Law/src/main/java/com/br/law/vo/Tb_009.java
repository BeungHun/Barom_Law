package com.br.law.vo;

public class Tb_009 {
	private int aplcn_atch_file_proper_num;
	private int aplcn_dtls_proper_num;
	private String file_code;
	private String file_type;
	private String original_file_name;
	private String file_path;
	public Tb_009() {
		super();
	}
	public Tb_009(int aplcn_atch_file_proper_num, int aplcn_dtls_proper_num, String file_code, String file_type,
			String original_file_name, String file_path) {
		super();
		this.aplcn_atch_file_proper_num = aplcn_atch_file_proper_num;
		this.aplcn_dtls_proper_num = aplcn_dtls_proper_num;
		this.file_code = file_code;
		this.file_type = file_type;
		this.original_file_name = original_file_name;
		this.file_path = file_path;
	}
	public int getAplcn_atch_file_proper_num() {
		return aplcn_atch_file_proper_num;
	}
	public void setAplcn_atch_file_proper_num(int aplcn_atch_file_proper_num) {
		this.aplcn_atch_file_proper_num = aplcn_atch_file_proper_num;
	}
	public int getAplcn_dtls_proper_num() {
		return aplcn_dtls_proper_num;
	}
	public void setAplcn_dtls_proper_num(int aplcn_dtls_proper_num) {
		this.aplcn_dtls_proper_num = aplcn_dtls_proper_num;
	}
	public String getFile_code() {
		return file_code;
	}
	public void setFile_code(String file_code) {
		this.file_code = file_code;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public String getOriginal_file_name() {
		return original_file_name;
	}
	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	@Override
	public String toString() {
		return "[Tb_009] " + "aplcn_atch_file_proper_num : " + aplcn_atch_file_proper_num + 
				", aplcn_dtls_proper_num : "+ aplcn_dtls_proper_num +
				", file_code" + file_code + 
				", file_type" + file_type + 
				", original_file_name" + original_file_name + 
				", file_path" + file_path
				;
				
	}    
	
}
