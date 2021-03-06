/**
 * @file uart.c 
 * @brief This file contains the functions for UART interface
 *			of the Freedom Freescale board.  
 *
 * These functions were originally developed by Rhea Cooper
 *  and Brian Kelly modified and improved the code.  
 *
 * @author Brian Kelly and Rhea Cooper
 * @date October 24, 2017
 *
 */

#ifdef KL25Z

#include "uart.h"

void UART_configure()
{
	/* enabling clock to Port A */
	SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;

	/* enabling clock to UART0 */
	SIM_SCGC4 |= SIM_SCGC4_UART0_MASK;

	/* disable the TX & RX register */
	UART_C2 &= ~UART0_C2_TE_MASK & ~UART0_C2_RE_MASK;

	/* FLL/PLL source to select 48 Mhz clock */
	SIM->SOPT2 |= SIM_SOPT2_UART0SRC((CLOCK_SETUP));
	SIM->SOPT2 |= SIM_SOPT2_PLLFLLSEL_MASK;

	UART0_C2 = 0;
	UART0_C1 = 0;
	UART0_C3 = 0;
	UART0_S1 |= 0x00;
	UART0_S2 = 0x00;

	UART0_BDH = (SBR >> 8) & UARTLP_BDH_SBR_MASK;
	UART0_BDL = (SBR & UARTLP_BDL_SBR_MASK);
	UART0_C4  = UARTLP_C4_OSR(OSR - 1);

	/* set pins to uart0 RX/RX */
	PORTA_PCR1 |= PORT_PCR_MUX(2);         
	PORTA_PCR2 |= PORT_PCR_MUX(2); 

	/* Configure the TX pin as output */
	PTA_BASE_PTR->PDDR |= (1<<2);      

	/* enabling the transmitting, receiving, and receive/transmit interrupts */
	UART0_C2 = UARTLP_C2_TE_MASK | UARTLP_C2_RE_MASK | UARTLP_C2_RIE_MASK;

	/* Interrupt enabling */
	NVIC_ICPR |= (1<<(INT_UART0-16));
	NVIC_ISER |= (1<<(INT_UART0-16));
}

void UART_send(uint8_t data)
{	
	while(!(UART0_S1 & UART0_S1_TDRE_MASK)){ }
	UART0_D = data;
}

uint8_t UART_receive()
{	
	uint8_t c;
	while(!(UART0_S1 & UART0_S1_RDRF_MASK)){ }
	c=UART0_D;
	return c;
}

void UART_send_n(uint8_t *data, uint8_t count)
{
	for(uint8_t i=0;i<=count;i++)
	{
		while(!(UART0_S1 & UART0_S1_TDRE_MASK)){ }
		UART0_D=*(data+i);
	}
	
}	

void UART_receive_n(uint8_t *data, uint8_t count)
{	
	for(uint8_t i=0;i<=count;i++)
	{
		while(!(UART0_S1 & UART0_S1_RDRF_MASK)){ }
		*(data+i)=UART0_D;
	}
}

void UART0_IRQHandler()
{	
	__disable_irq(); // global disable IRQs
	/* Check if interrupt is for TX or RX and handle accordingly
	 * For TX interrupt we take the data from TX buffer and
	 * sent it to UART to transmit*/
        if((UART0_S1 & UART_S1_TDRE_MASK)!=0)
		{
			uint8_t data;
			uint16_t i;
			while(CB_TX->count!=0)
			{
				CB_RemoveItem(CB_TX,&data);
				UART0_D=data;
            	for (i=2000;i>0;i--);  //wait for it to get sent
			}
		
			/*Disabling TX interrupt bit*/
			UART0_C2 &= ~UART_C2_TIE_MASK;
   		}

    /* For RX interrupt check add data to the RX buffer and
     * analyse the data to check if it is an alphabet, number,
     * punctuation or a miscellaneous characters*/
		else if((UART0_C2 & UART_C2_RIE_MASK)!=0 )
		{
	        if((UART0_S1 & UART_S1_RDRF_MASK)!=0)
			{
				uint8_t c= UART0_D;   
				rec_data = c;        //updating the global variable
    			rec_data_count++;
    			CB_AddItem(CB_RX,&c);
			
				/*analyse is a global variable in the project2.h file*/
    			analyse = 1;     //only setting a flag instead of calling the function as ISR should be as short as possible
    			UART0_C2|=UART_C2_RIE_MASK;
		}
	}
	__enable_irq(); // global disable IRQs
	
}

#endif /* ifdef KL25Z */
