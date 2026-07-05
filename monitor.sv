class monitor;

  virtual arb_if vif;
  mailbox #(transaction) mon2scb;

  function new(virtual arb_if vif,
               mailbox #(transaction) mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction

  task run();
    transaction t;
    $display("MONITOR RUNNING");
    forever begin
      #6;
      t = new();
      t.req = vif.req;
      t.grant = vif.grant;
      mon2scb.put(t);
    end
  endtask

endclass
