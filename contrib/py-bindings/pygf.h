#include <Python.h>
//#include "pgf.h"
#include "HsFFI.h"

#ifdef __GLASGOW_HASKELL__
#include "PyGF_stub.h"

extern void __stginit_PyGF ( void );
#endif

static inline void gf_init(int *argc, char ***argv)
{
  hs_init(argc, argv);
#ifdef __GLASGOW_HASKELL__
  hs_add_root(__stginit_PyGF);
#endif
}

static inline void gf_exit(void)
{
  hs_exit();
}

typedef HsStablePtr GF_PGF;
typedef HsStablePtr GF_CId;
typedef HsStablePtr GF_Language;
typedef HsStablePtr GF_Type;
typedef HsStablePtr GF_Tree;
typedef HsStablePtr GF_Expr;
typedef struct {
  PyObject_HEAD;
  HsStablePtr sp;
} PyGF;

#define NEWOBJECT(OBJ, GFTYPE) typedef struct {\
  PyObject_HEAD \
  GFTYPE obj; \
  } OBJ;

#define NEWTYPE(TYPE,NAME,OBJECT,DOC) static PyTypeObject TYPE = {\
    PyObject_HEAD_INIT(NULL)\
    0,                         /*ob_size*/\
    NAME,             /*tp_name*/\
    sizeof(OBJECT), /*tp_basicsize*/\
    0,                         /*tp_itemsize*/\
    0,                         /*tp_dealloc*/\
    0,                         /*tp_print*/\
    0,                         /*tp_getattr*/\
    0,                         /*tp_setattr*/\
    0,                         /*tp_compare*/\
    0,                         /*tp_repr*/\
    0,                         /*tp_as_number*/\
    0,                         /*tp_as_sequence*/\
    0,                         /*tp_as_mapping*/\
    0,                         /*tp_hash */\
    0,                         /*tp_call*/\
    0,                         /*tp_str*/\
    0,                         /*tp_getattro*/\
    0,                         /*tp_setattro*/\
    0,                         /*tp_as_buffer*/\
    Py_TPFLAGS_DEFAULT,        /*tp_flags*/\
    DOC,           /* tp_doc */\
  };
#define NEWGF(OBJ,GFTYPE,TYPE,NAME,DOC) NEWOBJECT(OBJ,GFTYPE)   \
  NEWTYPE(TYPE,NAME,OBJ,DOC)


NEWOBJECT(CID, GF_CId)
