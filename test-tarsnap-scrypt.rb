require "scrypt"

secrethex = '020000004c1271c211717198227392b029a64a7971931d351b387bb80db027f270411e398a07046f7d4a08dd815412a8712f874a7ebf0507e3878bd24e20a3b73fd750a667d2f451eac7471b00de6659'
puts secrethex
secretbytes = [secrethex].pack("H*")
salt = secretbytes
puts secretbytes.bytesize
hash = SCrypt::Engine.__sc_crypt(secretbytes, salt, 1024, 1, 1, 32)
puts hash.reverse.unpack("H*")
puts "00000000002bef4107f882f6115e0b01f348d21195dacd3582aa2dabd7985806\n"
