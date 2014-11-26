﻿using BankProject.Repository;
using DotNetNuke.Entities.Modules;
using System;
using System.Data;
using Telerik.Web.UI;
using BankProject.Common;
using BankProject.DataProvider;

namespace BankProject.Views.TellerApplication
{
    public partial class TransferWithdrawal : PortalModuleBase
    {
        private void LoadToolBar(bool IsAuthorize)
        {
            RadToolBar1.FindItemByValue("btCommit").Enabled = !IsAuthorize;
            RadToolBar1.FindItemByValue("btPreview").Enabled = !IsAuthorize;
            RadToolBar1.FindItemByValue("btAuthorize").Enabled = IsAuthorize;
            RadToolBar1.FindItemByValue("btReverse").Enabled = IsAuthorize;
            RadToolBar1.FindItemByValue("btSearch").Enabled = false;
            RadToolBar1.FindItemByValue("btPrint").Enabled = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack) return;

            if (Request.QueryString["preview"] == null)
            {
                this.ShowInputView();
                LoadToolBar(false);
            }
            else
            {
                this.ShowPreviewView();
            }
        }

        protected void OnRadToolBarClick(object sender, RadToolBarEventArgs e)
        {
            var toolBarButton = e.Item as RadToolBarButton;
            string commandName = toolBarButton.CommandName;

            switch (commandName)
            {
                case "Commit":
                    if (hdfCheckOverdraft.Value == "0" || hdfCheckCredit.Value == "0" || hdfCheckDebit.Value == "0") return;
                    if (cmbDebitCurrency.Text != cmbCreditCurrency.Text)
                    {
                        ShowMsgBox("Currency of Credit Account is which is not matching with Currency of Debit Account"); return;
                    }
                    //if (lbErrorCreditAccount.Text == "Credit account does not exist" || lbErrorDebitAccount.Text == "Debit account does not exist")
                    //{
                    //    ShowMsgBox("Credit Account Or Debit Account does not exist !"); return;
                    //}

                    BankProject.DataProvider.Database.BTRANSFERWITHDRAWAL_Insert(rcbAccountType.SelectedValue, txtId.Text, cmbDebitAccount.Text, txtDebitAmt.Value.HasValue ? txtDebitAmt.Value.Value : 0, 
                        lblCustBal.Value.HasValue ? lblCustBal.Value.Value : 0, lblNewCustBal.Value.HasValue ? lblNewCustBal.Value.Value : 0,
                        rdpValueDate.SelectedDate, cmbCreditAccount.Text, lblAmtCreditForCust.Value.HasValue ? lblAmtCreditForCust.Value.Value : 0, txtDealRate.Value.HasValue ? txtDealRate.Value.Value : 0,
                        rdpCreditValueDate.SelectedDate, cmbWaiveCharges.SelectedValue, txtNarrative.Text, this.UserId, lblCustomerId.Text, lblCustomerName.Text
                        , lbCustomerID_CR.Text, lbCustomerName_CR.Text, cmbDebitCurrency.Text, cmbCreditCurrency.Text, UserInfo.Username.ToString(),
                        tbCredit_OldCustBallance.Value.HasValue? tbCredit_OldCustBallance.Value.Value : 0, tbCredit_NewCustBallance.Value.HasValue? tbCredit_NewCustBallance.Value.Value : 0);

                    if (cmbWaiveCharges.SelectedValue == "NO") Response.Redirect(EditUrl("waivecharges"));

                    Response.Redirect(string.Format("Default.aspx?tabid={0}", this.TabId.ToString()));
                    break;

                case "Preview":
                    string unBlockAccountPreviewList = this.EditUrl("TransferWithdrawalPreviewList");
                    this.Response.Redirect(unBlockAccountPreviewList);
                    break;

                case "Authorize":
                    string Status = Database.BCASHDEPOSIT_LoadStatus(txtId.Text, "TransferWithdrawal");
                     if (Status != "AUT")
                     {
                         DataProvider.Database.BTRANSFERWITHDRAWAL_UpdateStatus(rcbAccountType.SelectedValue, "AUT", txtId.Text, this.UserId.ToString());
                         Response.Redirect(string.Format("Default.aspx?tabid={0}", this.TabId.ToString()));
                     }
                     else
                     {
                         ShowMsgBox("This transaction already authorized . You can not authorize it again !"); return;
                     }
                    break;

                case "Reverse":
                    DataProvider.Database.BTRANSFERWITHDRAWAL_UpdateStatus(rcbAccountType.SelectedValue, "REV", txtId.Text, this.UserId.ToString());
                    Response.Redirect(string.Format("Default.aspx?tabid={0}", this.TabId.ToString()));
                    break;
                case "Print":
                    Print_Deal_Slip();
                    break;
            }
        }

        private void EnableControls(bool enable)
        {
            BankProject.Controls.Commont.SetTatusFormControls(this.Controls, enable);
        }

        private void ShowPreviewView()
        {
            if (Request.QueryString["preview"] == null)
                return;

            this.SetPreviewValues("");
            this.EnableControls(false);
        }

        private void ShowInputView()
        {
            this.SetDefaultValues();
        }

        private void SetPreviewValues(string code)
        {
            DataSet ds;
            if (code != "")
                //ds = DataProvider.Database.BTRANSFERWITHDRAWAL_GetByCode(code);
                ds = DataProvider.Database.BTRANSFERWITHDRAWAL_GetByID(code);
            else
                ds = DataProvider.Database.BTRANSFERWITHDRAWAL_GetByID((Request.QueryString["codeid"].ToString()));
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtId.Text = ds.Tables[0].Rows[0]["Code"].ToString();
                this.cmbDebitAccount.Text = ds.Tables[0].Rows[0]["DebitAccount"].ToString();
                rcbAccountType.SelectedValue = ds.Tables[0].Rows[0]["AccountType"].ToString();
                cmbDebitAccount_TextChanged(cmbDebitAccount, null);
                this.txtDebitAmt.Value = ds.Tables[0].Rows[0]["DebitAmount"] != null && ds.Tables[0].Rows[0]["DebitAmount"] != DBNull.Value ?
                                                double.Parse(ds.Tables[0].Rows[0]["DebitAmount"].ToString()) : 0;

                this.lblCustBal.Value = ds.Tables[0].Rows[0]["CustBallance"] != null && ds.Tables[0].Rows[0]["CustBallance"] != DBNull.Value ?
                                                double.Parse(ds.Tables[0].Rows[0]["CustBallance"].ToString()) : 0;

                this.lblNewCustBal.Value = ds.Tables[0].Rows[0]["NewCustBallance"] != null && ds.Tables[0].Rows[0]["NewCustBallance"] != DBNull.Value
                                            ? double.Parse(ds.Tables[0].Rows[0]["NewCustBallance"].ToString()) : 0;

                if (ds.Tables[0].Rows[0]["DebitValueDate"] != null && ds.Tables[0].Rows[0]["DebitValueDate"] != DBNull.Value)
                    this.rdpValueDate.SelectedDate = DateTime.Parse(ds.Tables[0].Rows[0]["DebitValueDate"].ToString());

                this.cmbCreditAccount.Text = ds.Tables[0].Rows[0]["CreditAccount"].ToString();
                cmbCreditAccount_TextChanged(cmbCreditAccount, null);

                this.lblAmtCreditForCust.Value = ds.Tables[0].Rows[0]["AmountCreditForCustomer"] != null && ds.Tables[0].Rows[0]["AmountCreditForCustomer"] != DBNull.Value ?
                                            double.Parse(ds.Tables[0].Rows[0]["AmountCreditForCustomer"].ToString()) : 0;

                this.txtDealRate.Value = ds.Tables[0].Rows[0]["DealRate"] != null && ds.Tables[0].Rows[0]["DealRate"] != DBNull.Value ?
                                        double.Parse(ds.Tables[0].Rows[0]["DealRate"].ToString()) : 0;

                if (ds.Tables[0].Rows[0]["CreditValueDate"] != null && ds.Tables[0].Rows[0]["CreditValueDate"] != DBNull.Value)
                    this.rdpCreditValueDate.SelectedDate = DateTime.Parse(ds.Tables[0].Rows[0]["CreditValueDate"].ToString());

                this.cmbWaiveCharges.SelectedValue = ds.Tables[0].Rows[0]["WaiveCharges"].ToString();
                this.txtNarrative.Text = ds.Tables[0].Rows[0]["Narrative"].ToString();
                tbCredit_OldCustBallance.Text = ds.Tables[0].Rows[0]["Credit_OldBalance"].ToString();
                tbCredit_NewCustBallance.Text = ds.Tables[0].Rows[0]["Credit_NewBalance"].ToString();
                bool isautho = ds.Tables[0].Rows[0]["Status"].ToString() == "AUT";
                this.EnableControls(Request.QueryString["codeid"] == null && !isautho);
                LoadToolBar(Request.QueryString["codeid"] != null);

                if (isautho)
                {
                    RadToolBar1.FindItemByValue("btCommit").Enabled = false;
                    RadToolBar1.FindItemByValue("btPreview").Enabled = true;
                    RadToolBar1.FindItemByValue("btAuthorize").Enabled = false;
                    RadToolBar1.FindItemByValue("btReverse").Enabled = false;
                    RadToolBar1.FindItemByValue("btSearch").Enabled = false;
                    RadToolBar1.FindItemByValue("btPrint").Enabled = true;
                }
            }
        }

        private void SetDefaultValues()
        {
            BankProject.Controls.Commont.SetEmptyFormControls(this.Controls);
            string SoTT = BankProject.DataProvider.Database.B_BMACODE_GetNewSoTT("TRANSFERWITHDRAWAL").Tables[0].Rows[0]["SoTT"].ToString();
            this.txtId.Text = "TT." + Util.getIDDate() + "." + SoTT.PadLeft(5, '0');

            rdpValueDate.SelectedDate = DateTime.Today;
            rdpCreditValueDate.SelectedDate = DateTime.Today;
        }

        protected void cmbDebitAccount_TextChanged(object sender, EventArgs e)
        {
            if (cmbDebitAccount.Text != "" && rcbAccountType.SelectedValue != "")
            {
                DataSet ds = BankProject.DataProvider.Database.BOPENACCOUNT_GetByCode_OPEN(cmbDebitAccount.Text, rcbAccountType.SelectedValue);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    txtDebitAmt.Text = ""; lblCustBal.Text = "";
                    lblCustomerId.Text = ds.Tables[0].Rows[0]["CustomerId"].ToString();
                    lblCustomerName.Text = ds.Tables[0].Rows[0]["CustomerName"].ToString();
                    lbDebitAccountId.Text = ds.Tables[0].Rows[0]["Id"].ToString();
                    cmbDebitCurrency.Text = ds.Tables[0].Rows[0]["Currency"].ToString();
                    lbDebitAccountTitle.Text = ds.Tables[0].Rows[0]["AccountTitle"].ToString();

                    if (ds.Tables[0].Rows[0]["WorkingAmount"] != null && ds.Tables[0].Rows[0]["WorkingAmount"] != DBNull.Value)
                        lblCustBal.Value = double.Parse(ds.Tables[0].Rows[0]["WorkingAmount"].ToString());
                    lbErrorDebitAccount.Visible = false;
                    hdfCheckDebit.Value = "1";
                }
                else
                {
                    hdfCheckDebit.Value = "0";
                    lbErrorDebitAccount.Visible = true;
                    lbErrorDebitAccount.Text = "Debit account does not exist";
                    cmbDebitAccount.Text = "";
                    lblCustomerId.Text = "";
                    lblCustomerName.Text = "";
                    lbDebitAccountTitle.Text = "";
                    cmbDebitCurrency.Text = "";
                    lblCustBal.Text = "";
                }
            }
            else
            {
                hdfCheckDebit.Value = "0";
                lbErrorDebitAccount.Text = "";
                cmbDebitAccount.Text = "";
                lblCustomerId.Text = "";
                lblCustomerName.Text = "";
                lbDebitAccountTitle.Text = "";
                cmbDebitCurrency.Text = "";
                lblCustBal.Text = "";
            }
        }
        protected void Print_Deal_Slip()
        {
            Aspose.Words.License license = new Aspose.Words.License();
            license.SetLicense("Aspose.Words.lic");
            //Open template
            string docPath = Context.Server.MapPath("~/DesktopModules/TrainingCoreBanking/BankProject/Report/Template/OutWardTransactions/transfer_withdrawl.doc");
            //Open the template document
            Aspose.Words.Document document = new Aspose.Words.Document(docPath);
            //Execute the mail merge.
            var ds = BankProject.DataProvider.TriTT.Print_Deal_slip("Transfer", "Withdrawal", txtId.Text.Trim());
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                ds.Tables[0].TableName = "Info";
                document.MailMerge.ExecuteWithRegions(ds.Tables["Info"]);
                document.Save("Trans_Withdrawal_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".doc", Aspose.Words.SaveFormat.Doc, Aspose.Words.SaveType.OpenInBrowser, Response);
            }
        }
        protected void cmbCreditAccount_TextChanged(object sender, EventArgs e)
        {
            if (cmbCreditAccount.Text != "" && rcbAccountType.SelectedValue != "")
            {
                DataSet ds = BankProject.DataProvider.Database.BOPENACCOUNT_GetByCode_OPEN(cmbCreditAccount.Text, rcbAccountType.SelectedValue);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    lbCustomerID_CR.Text = ds.Tables[0].Rows[0]["CustomerId"].ToString();
                    lbCustomerName_CR.Text = ds.Tables[0].Rows[0]["CustomerName"].ToString();
                    lbCreditAccountId.Text = ds.Tables[0].Rows[0]["Id"].ToString();
                    cmbCreditCurrency.Text = ds.Tables[0].Rows[0]["Currency"].ToString();
                    lbCreditAccountTitle.Text = ds.Tables[0].Rows[0]["AccountTitle"].ToString();
                    tbCredit_OldCustBallance.Text = ds.Tables[0].Rows[0]["WorkingAmount"].ToString();
                    tbCredit_NewCustBallance.Text = Convert.ToString(Convert.ToDouble(tbCredit_OldCustBallance.Text !="" ?tbCredit_OldCustBallance.Text : "0") + (txtDebitAmt.Value.HasValue ? txtDebitAmt.Value.Value:0));
                    hdfCheckCredit.Value = "1";
                    lbErrorCreditAccount.Visible = false;
                }
                else
                {
                    hdfCheckCredit.Value = "0";
                    lbErrorCreditAccount.Visible = true;
                    lbErrorCreditAccount.Text = "Credit account does not exist";
                    cmbCreditAccount.Text = "";
                    lbCustomerID_CR.Text = "";
                    lbCustomerName_CR.Text = "";
                    lbCreditAccountTitle.Text = "";
                    cmbCreditCurrency.Text = "";
                }
            }
            else
            {
                hdfCheckCredit.Value = "0";
                lbErrorCreditAccount.Visible = false;
                cmbCreditAccount.Text = "";
                lbCustomerID_CR.Text = "";
                lbCustomerName_CR.Text = "";
                lbCreditAccountTitle.Text = "";
                cmbCreditCurrency.Text = "";
            }
        }

        protected void rcbAccountType_OnSelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cmbDebitAccount_TextChanged(cmbDebitAccount, null);
            cmbCreditAccount_TextChanged(cmbCreditAccount, null);
        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            SetPreviewValues(txtId.Text);//
        }
        protected void ShowMsgBox(string contents, int width = 420, int hiegth = 150)
        {
            string radalertscript =
                "<script language='javascript'>function f(){radalert('" + contents + "', " + width + ", '" + hiegth +
                "', 'Warning'); Sys.Application.remove_load(f);}; Sys.Application.add_load(f);</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "radalert", radalertscript);
        }
    }
}