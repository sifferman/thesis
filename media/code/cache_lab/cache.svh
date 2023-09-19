//                  DLL Structure                   //
// MRU - ... - way.mru - way - way.lru - ... -  LRU //

typedef logic [$clog2(NR_ENTRIES)-1:0] way_index_t;

struct packed {
    logic [TAG_SIZE-1:0] tag;
    way_index_t lru; // less recently used
    way_index_t mru; // more recently used
    logic valid;
} dll_d[NR_ENTRIES], dll_q[NR_ENTRIES];

// lru register
way_index_t lru_d, lru_q, mru_d, mru_q;

// index to bump
way_index_t read_index, write_index;


// separate the data from the dll help with optimization
logic [LINE_WIDTH-1:0] data_d[NR_ENTRIES], data_q[NR_ENTRIES];
