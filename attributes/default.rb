default["vslinko"]["user"] = "vyacheslav"
default["vslinko"]["group"] = default["vslinko"]["user"]
default["vslinko"]["home"] = "/home/#{default["vslinko"]["user"]}"
default["vslinko"]["public_key"] = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDAAsD2855W6aF3yxPz+BItZyTFQntt5A7T6/XBEBloqFbL4ZD9XbP4X3XNUXocPY4vakuk1ntvnOsB0nM51Zi/u2e4T5TlZ34wjW2Oa7FhJgavj5oq7HEEWKOiefU/b1HcONwPDsVCjZIaXfUQB7ZrhGfaGaib51UNmujikJLzL0o06GKOr2JfL4M0lrR21itRYT8irSr6lSSBT4eoRZfmM8kkv/+zyiqPQtIlGmhZ8s+VAFspdnC7ndBLBte4K8XTCL9afnelhm12w33PoBlwwICxou+BrWmMi/Rvdoo9bqVC46nrE2RVcDTf2fWO7/EKaxh/IIwDUJEVluNibMz2JwnFUyiNSIMCxHp+AvnKnCt0NEpmNks6y5hS5Nfz4AD6FNwvsC8N26P9wq/THy9m/14eKGvRAorD5CYGDV0JaZiMwYOtLpknRiHSs+ymgQL0eKg4o5sRVaycAmgpeiwQRZsRZjfZGSb/KHVR0XIm1gHAAztwA53gw9Bqbfc+MizMUELfYGoo3vfMZJJEB1GA9Op8nUGooI27u1aCiOvIT4Hk/UPp4gp9TaqiPTGXH17pYbV8aIsmKfeWRRP9j0GT8VPCCbDIsPvAV/7J2/O2ZYvfForMSuBLj2xtZBHv3SHX5axH55mY0jKAQUd8lTK0rbkSZZMGr/ufptrh6R5yVw=="
default["vslinko"]["dotfiles"] = "git://github.com/vslinko/dotfiles.git"

override["authorization"]["sudo"]["include_sudoers_d"] = true
