
$(document).ready(function() {

	// validate of product form
    $("#productForm").validate({
        rules: {
            productName: {
                required: true,
            },
            slug: {
                required: true,
            },
            category: {
                required: true,
            },
            quantity: {
                required: true,
            },
            price: {
                required: true,
            },
            thumbnail: {
                required: true,
            },
            color1: {
                required: true,
            },
            hex1: {
                required: true,
            },
            image1_1: {
                required: true,
            },
        },
        messages: {
            productName: {
                required: "Please enter a product name!"
            },
            slug: {
                required: "Please enter a slug!"
            },
            category: {
                required: "Please choose a category!"
            },
            quantity: {
                required: "Please enter a quantity!"
            },
            price: {
                required: "Please enter a price!"
            },
            thumbnail: {
                required: "Please enter a thumbnail!"
            }
        }
    });
    
	$.validator.addMethod('accept', function () { return true; });
    // validate model register
    $("#registerForm").validate({
        rules: {
            username: {
                required: true,
            },
            password: {
                required: true,
            },
            confirm: {
                required: true,
            },
            fullname: {
                required: true,
            },
            email: {
                required: true,
            },
            gender: {
                required: true,
            },
            phone: {
                required: true,
            },
            avatar: {
                required: true,
                accept: true
            },
            address: {
                required: true,
            }
        },
        messages: {
            username: {
                required: "H??y nh???p t??i kho???n mu???n ????ng k??!",
            },
            password: {
                required: "H??y nh???p m???t kh???u c???a b???n!",
            },
            confirm: {
                required: "H??y nh???p x??c nh???n m???t kh???u c???a b???n!",
            },
            fullname: {
                required: "H??y nh???p h??? t??n c???a b???n!",
            },
            email: {
                required: "H??y nh???p email c???a b???n!",
            },
            gender: {
                required: "H??y ch???n gi???i t??nh c???a b???n!",
            },
            phone: {
                required: "H??y nh???p s??? ??i???n tho???i c???a b???n!",
            },
            avatar: {
                required: "H??y ch???n h??nh ???nh ?????i di???n c???a b???n!",
            },
            address: {
                required: "H??y nh???p ?????a ch??? c???a b???n!",
            }
        }
    });
    
    // validate model login
    $("#loginForm").validate({
        rules: {
			username: {
                required: true,
            },
            password: {
                required: true,
            }
        },
        messages: {
			username: {
                required: "H??y nh???p t??n t??i kho???n c???a b???n!",
            },
            password: {
                required: "H??y nh???p m???t kh???u c???a b???n!",
            }
        }
    });
    
    // validate model edit profile
    $("#edit_profile").validate({
        rules: {
            fullname: {
                required: true,
            },
            email: {
                required: true,
            },
            gender: {
                required: true,
            },
            phone: {
                required: true,
            },
            avatar: {
                required: true,
                accept: true
            },
            address: {
                required: true,
            }
        },
        messages: {
            fullname: {
                required: "H??y nh???p h??? t??n c???a b???n!",
            },
            email: {
                required: "H??y nh???p email c???a b???n!",
            },
            gender: {
                required: "H??y ch???n gi???i t??nh c???a b???n!",
            },
            phone: {
                required: "H??y nh???p s??? ??i???n tho???i c???a b???n!",
            },
            avatar: {
                required: "H??y ch???n h??nh ???nh ?????i di???n c???a b???n!",
            },
            address: {
                required: "H??y nh???p ?????a ch??? c???a b???n!",
            }
        }
    });
    
    // validate change password
    $("#change_password").validate({
        rules: {
            password: {
                required: true,
            },
            newpassword: {
                required: true,
            },
            newconfirm: {
                required: true,
            }
        },
        messages: {
            password: {
                required: "H??y nh???p m???t kh???u c???a b???n!",
            },
            newpassword: {
                required: "H??y nh???p m???t kh???u m???i c???a b???n!",
            },
            newconfirm: {
                required: "H??y nh???p x??c nh???n m???t kh???u m???i c???a b???n!",
            }
        }
    });
    
    
    // validate check out
    $("#checkout").validate({
        rules: {
            address: {
                required: true,
            },
            phone: {
                required: true,
            }
        },
        messages: {
            address: {
                required: "H??y nh???p ?????a ch??? c???a b???n!",
            },
            phone: {
                required: "H??y nh???p s??? ??i???n tho???i c???a b???n!",
            }
        }
    });
    
    // validate model fogot
    $("#forgotForm").validate({
        rules: {
			username: {
                required: true,
            },
            email: {
                required: true,
            }
        },
        messages: {
			username: {
                required: "H??y nh???p t??n t??i kho???n c???a b???n!",
            },
            email: {
                required: "H??y nh???p email c???a b???n!",
            }
        }
    });
})