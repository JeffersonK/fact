
namespace java com.hvf.alephnull.fact.thrift

include "hvf.thrift"

enum Operation {
  NO_OP = 0, /* used for pure eventing */
  SYNCH_TIME_OP = 1,
  IDENTITY_OP = 2,  
  BLOBSTORE_OP = 99 //used to put large digitial objects that are not simple API calls or events
}


enum ContentType {
  JSON = 0,
  BLOB = 1
}

/* 
 struct BlobPayload {
   1: required ContentType ctype;//media format
   2: required string payload;
   12: optional BlobPayload; 
}
*/
 
/*
struct FactContainer {
  1: required Fact fact;
  2: optional i32 window_segment_id;
  3: optional list<TracePoint> ptrace;
  4: optional list<TracePoint> dtrace;
}
*/

typedef i64 MicroTimestamp

struct PhysicalLocation {
  1: required double lattitude;
  2: required double longitude;
}

struct VirtualLocation {
  1: optional string url;
  2: optional i32 ipv4_address;
  3: optional i64 ipv6_address;
}

struct DeviceContext {
  1: required map<string,string> tags;
}

struct TracePoint {
  1: required string src;
  2: required string label;
  3: required MicroTimestamp utc_ts;
}  

struct Fact {
  1: required string developer_key;
  2: required string application_key;

  3: required string p_uuid; //physical uuid
  4: optional PhysicalLocation p_loc;  

  5: optional string v_uuid; //virtual uuid
  6: optional VirtualLocation v_loc;

  7: required MicroTimestamp utc_tx;
  8: optional MicroTimestamp utc_rx; /* optional because it won't be set until it gets to server */

  /* ??? should we or not ??? */
  9: required i32 sequence_num; /* restarts at 0 everytime a client connects to an agent */

  10: required Operation op;    /* the RPC function  */
  11: required list<string> argv; /* for DRPC the request id is an argument */

  12: optional DeviceContext d_context;

  /*
   13: optional list<TracePoint> chckpts;
   14: optional DebugContext dbg;
   */
}

enum ResultCode {
  SUCCESS = 0,
  ERROR = 1,
  WARNING = 2
}


struct RPCResult {
  1: required ResultCode rc;
  2: optional string body;
}

struct SynchResult {
  1: required ResultCode rc;
  2: required i64 offset;
}

service AlephNullFrontEnd extends hvf.HVFService {
  SynchResult open(1:Fact f);
  RPCResult send(1:Fact f);
  oneway void fire(1:Fact f);
  
}