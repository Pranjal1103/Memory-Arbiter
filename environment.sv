class environment;

  generator gen;
  agent agt;
  scoreboard scb;
  coverage cov;

  mailbox #(transaction) gen2drv;
  mailbox #(transaction) mon2scb;

  virtual arb_if vif;

  function new(virtual arb_if vif);

    this.vif = vif;

    gen2drv = new();
    mon2scb = new();

    gen = new(gen2drv);
    agt = new(vif, gen2drv, mon2scb);
    scb = new(mon2scb);
    cov = new(vif);

  endfunction

  task run();

    fork
      gen.run();
      agt.run();
      scb.run();
      cov.run();
    join_none

    $display("ENVIRONMENT STARTED");

  endtask

endclass
