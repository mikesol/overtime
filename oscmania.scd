NetAddr.langPort;
NetAddr.localAddr
o = OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; }, '/goodbye', n);
n = NetAddr.new("192.168.0.11", 57109);
n = NetAddr.new("127.0.0.1", 57120);

OSCFunc.trace(true);