class scoreboard;

  mailbox #(transaction) mon2scb;

  function new(mailbox #(transaction) mon2scb);
    this.mon2scb = mon2scb;
  endfunction

  function bit [3:0] ref_model(bit [3:0] req);
    if (req[0]) return 4'b0001;
    else if (req[1]) return 4'b0010;
    else if (req[2]) return 4'b0100;
    else if (req[3]) return 4'b1000;
    else return 4'b0000;
  endfunction

  task run();
    transaction t;
    bit [3:0] expected;

    $display("SCOREBOARD RUNNING");

    forever begin
      mon2scb.get(t);
      expected = ref_model(t.req);

      $display("REQ=%b GRANT=%b EXP=%b %s",
        t.req, t.grant, expected,
        (t.grant===expected)?"PASS":"FAIL");
    end
  endtask

endclass
