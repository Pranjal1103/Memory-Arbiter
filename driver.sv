class driver;

  virtual arb_if vif;
  mailbox #(transaction) gen2drv;

  function new(virtual arb_if vif,
               mailbox #(transaction) gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction

  task run();
    transaction t;
    $display("DRIVER RUNNING");
    forever begin
      gen2drv.get(t);
      vif.req = t.req;
      #5;
    end
  endtask

endclass
