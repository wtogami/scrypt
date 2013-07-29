# FFI wrapper of optimized scrypt_1024_1_1_256() from litecoin-0.6.3

require "scrypt"

secrethex = '020000004c1271c211717198227392b029a64a7971931d351b387bb80db027f270411e398a07046f7d4a08dd815412a8712f874a7ebf0507e3878bd24e20a3b73fd750a667d2f451eac7471b00de6659'
secretbytes = [secrethex].pack("H*")
salt = ''
puts secretbytes.bytesize

FFI::MemoryPointer.new(:char, 32) do |hash|
  SCrypt::Ext.scrypt_1024_1_1_256(secretbytes, hash) 
  puts hash
  puts hash.class
  puts [hash.read_array_of_uint8(32).map {|e| "%02x" % e}.join].pack("H*").reverse.unpack("H*").first
  puts "00000000002bef4107f882f6115e0b01f348d21195dacd3582aa2dabd7985806\n"
end
