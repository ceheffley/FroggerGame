/*---------------------------------------------------------------------------
  --      main.c                                                    	   --
  --      Edited by Joseph Ravichandran during Spring 2019        		   --
  --                                                                	   --
  --      Christine Chen                                                   --
  --      Ref. DE2-115 Demonstrations by Terasic Technologies Inc.         --
  --      Fall 2014                                                        --
  --                                                                       --
  --      For use with ECE 385 Lab 8      		                           --
  --      UIUC ECE Department                                              --
  ---------------------------------------------------------------------------*/
//io_handler.c
#include "io_handler.h"
#include <stdio.h>
#include "alt_types.h"
#include "system.h"

void IO_init(void)
{
	*otg_hpi_reset = 1;
	*otg_hpi_cs = 1;
	*otg_hpi_r = 1;
	*otg_hpi_w = 1;
	*otg_hpi_address = 0;
	*otg_hpi_data = 0;
	// Reset OTG chip
	*otg_hpi_cs = 0;
	*otg_hpi_reset = 0;
	*otg_hpi_reset = 1;
	*otg_hpi_cs = 1;
}

void IO_write(alt_u8 Address, alt_u16 Data)
{
//*************************************************************************//
//									TASK								   //
//*************************************************************************//
//							Write this function							   //
//*************************************************************************//
	*otg_hpi_address = Address;

	*otg_hpi_cs = 0;

	*otg_hpi_w = 0;

	*otg_hpi_data = Data;

	*otg_hpi_cs = 1;

	*otg_hpi_w = 1;
}

alt_u16 IO_read(alt_u8 Address)
{
	alt_u16 temp;
//*************************************************************************//
//									TASK								   //
//*************************************************************************//
//							Write this function							   //
//*************************************************************************//

	*otg_hpi_address = Address;

	*otg_hpi_cs = 0;

	*otg_hpi_r = 0;

	*otg_hpi_cs = 1;

	*otg_hpi_r = 1;

	temp = *otg_hpi_data;

	//printf("%x\n",temp);
	return temp;
}
