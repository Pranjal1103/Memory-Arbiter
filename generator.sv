class generator;

  mailbox #(transaction) gen2drv;

  function new(mailbox #(transaction) gen2drv);
    this.gen2drv = gen2drv;
  endfunction
task run();
  transaction t;

  
  t=new(); t.req=4'b0000; gen2drv.put(t);
  t=new(); t.req=4'b0001; gen2drv.put(t);
  t=new(); t.req=4'b0010; gen2drv.put(t);
  t=new(); t.req=4'b0100; gen2drv.put(t);
  t=new(); t.req=4'b1000; gen2drv.put(t);

  t=new(); t.req=4'b0011; gen2drv.put(t);
  t=new(); t.req=4'b0110; gen2drv.put(t);
  t=new(); t.req=4'b1100; gen2drv.put(t);
  t=new(); t.req=4'b1111; gen2drv.put(t);
  t=new(); t.req=4'b1010; gen2drv.put(t);

 
  repeat (100) begin
    t = new();
    assert(t.randomize());
    gen2drv.put(t);
  end

  $display("GENERATOR DONE");
endtask
  
endclass
