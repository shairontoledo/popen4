#define MAX_STRING 512

static VALUE io_alloc _((VALUE));

static VALUE io_alloc(VALUE klass){
    NEWOBJ(io, struct RFile);
    OBJSETUP(io, klass, T_FILE);

    io->fptr = 0;

    return (VALUE)io;
}

int rb_io_mode_flags(const char* mode){
    int flags = 0;

    switch (mode[0]){
      case 'r':
         flags |= FMODE_READABLE;
         break;
      case 'w':
         flags |= FMODE_WRITABLE;
         break;
      case 'a':
         flags |= FMODE_WRITABLE;
         break;
      default:
         error:
         rb_raise(rb_eArgError, "illegal access mode %s", mode);
   }

   if(mode[1] == 'b'){
      flags |= FMODE_BINMODE;
      mode++;
   }

   if(mode[1] == '+'){
      flags |= FMODE_READWRITE;
      if(mode[2] != 0){
         goto error;
      }
   }
   else if(mode[1] != 0) goto error;

   return flags;
}

// Return an error code as a string
LPTSTR ErrorDescription(DWORD p_dwError)
{
   HLOCAL hLocal = NULL;
   static char ErrStr[MAX_STRING];
   int len;

   if (!(len=FormatMessage(
      FORMAT_MESSAGE_ALLOCATE_BUFFER |
      FORMAT_MESSAGE_FROM_SYSTEM |
      FORMAT_MESSAGE_IGNORE_INSERTS,
      NULL,
      p_dwError,
      MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), /* Default language */
      (LPTSTR)&hLocal,
      0,
      NULL)))
   {
      rb_raise(rb_eStandardError,"Unable to format error message");
   }
   memset(ErrStr, 0, MAX_STRING);
   strncpy(ErrStr, (LPTSTR)hLocal, len-2); /* remove \r\n */
   LocalFree(hLocal);
   return ErrStr;
}