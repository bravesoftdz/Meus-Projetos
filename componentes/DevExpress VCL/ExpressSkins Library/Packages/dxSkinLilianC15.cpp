//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("dxSkinLilian.res");
USEPACKAGE("rtl.bpi");
USEPACKAGE("dxCoreC15.bpi");
USEPACKAGE("vcl.bpi");
USEPACKAGE("dxGDIPlusC15.bpi");
USEPACKAGE("cxLibraryC15.bpi");
USEPACKAGE("dxSkinsCoreC15.bpi");
USEUNIT("dxSkinLilian.pas");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
//   Package source.
//---------------------------------------------------------------------------
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------