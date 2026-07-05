class coverage;

  virtual arb_if vif;

  covergroup cg;
    coverpoint vif.req;
    coverpoint vif.grant;
  endgroup

  function new(virtual arb_if vif);
    this.vif = vif;
    cg = new();
  endfunction

  task run();
    $display("COVERAGE RUNNING");
    forever begin
      #10;
      cg.sample();
    end
  endtask

endclass
