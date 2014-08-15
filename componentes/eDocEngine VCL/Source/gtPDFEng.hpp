// Borland C++ Builder
// Copyright (c) 1995, 2005 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Gtpdfeng.pas' rev: 10.00

#ifndef GtpdfengHPP
#define GtpdfengHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Gtcstplneng.hpp>	// Pascal unit
#include <Gtcstdoceng.hpp>	// Pascal unit
#include <Gtexpdfeng.hpp>	// Pascal unit
#include <Gtcstpdfeng.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Gtpdfeng
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TgtPDFEngine;
class PASCALIMPLEMENTATION TgtPDFEngine : public Gtexpdfeng::TgtExPDFEngine 
{
	typedef Gtexpdfeng::TgtExPDFEngine inherited;
	
public:
	#pragma option push -w-inl
	/* TgtExPDFEngine.Create */ inline __fastcall virtual TgtPDFEngine(Classes::TComponent* AOwner) : Gtexpdfeng::TgtExPDFEngine(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TgtExPDFEngine.Destroy */ inline __fastcall virtual ~TgtPDFEngine(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Gtpdfeng */
using namespace Gtpdfeng;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Gtpdfeng