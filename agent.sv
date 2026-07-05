class agent;

  driver drv;
  monitor mon;

  function new(virtual arb_if vif,
               mailbox #(transaction) gen2drv,
               mailbox #(transaction) mon2scb);

    drv = new(vif, gen2drv);
    mon = new(vif, mon2scb);

  endfunction

  task run();
    fork
      drv.run();
      mon.run();
    join_none

    $display("AGENT STARTED");
  endtask

endclass
