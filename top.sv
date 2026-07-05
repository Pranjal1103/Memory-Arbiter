`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "coverage.sv"
`include "agent.sv"
`include "environment.sv"

module top;

  arb_if vif();
  environment env;

  arbiter dut (
    .req(vif.req),
    .grant(vif.grant)
  );

  initial begin
    env = new(vif);
    env.run();
    #500;
    $finish;
  end

endmodule
