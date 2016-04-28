//+------------------------------------------------------------------+
//|                                                       Spread.mq5 |
//|                                              Eli de Faria Junior |
//|          https://br.linkedin.com/in/eli-de-faria-junior-430a5987 |
//+------------------------------------------------------------------+
#property copyright "Eli de Faria Junior"
#property link      "https://br.linkedin.com/in/eli-de-faria-junior-430a5987"
#property version   "1.00"
#property indicator_chart_window

#include "libs\Comment.mqh"

#define COLOR_BACK      clrBlack
#define COLOR_BORDER    clrDimGray
#define COLOR_CAPTION   clrDodgerBlue
#define COLOR_TEXT      clrLightGray
#define COLOR_WIN       clrLimeGreen
#define COLOR_LOSS      clrOrangeRed
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum tipos
  {
   inteiro=1,
   decimal=2,
  };
input tipos tipo=inteiro;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

CComment coment;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- remove panel 
   coment.Destroy();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
   criarComentario();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void criarComentario()
  {
   if(tipo==inteiro)
     {
      coment.SetText(0,"Spread: "+IntegerToString(getSpreadInt()),COLOR_TEXT);
        }else if(tipo==decimal){
      coment.SetText(0,"Spread: "+DoubleToString(getSpreadDouble()),COLOR_TEXT);
     }
   coment.Create("Spread",20,30);
   coment.SetAutoColors(true);
   coment.SetColor(COLOR_BORDER,COLOR_BACK,255);
   coment.SetFont("Lucida Console",13,false,1.7);
   coment.SetGraphMode(true);
   coment.Show();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

int getSpreadInt()
  {
   return (int)NormalizeDouble((SymbolInfoDouble(_Symbol,SYMBOL_ASK)-SymbolInfoDouble(_Symbol,SYMBOL_BID))/_Point/1,1);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double getSpreadDouble()
  {
   return NormalizeDouble((SymbolInfoDouble(_Symbol,SYMBOL_ASK)-SymbolInfoDouble(_Symbol,SYMBOL_BID))/_Point/1,1);
  }
//+------------------------------------------------------------------+
