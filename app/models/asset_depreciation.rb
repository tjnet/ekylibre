# = Informations
# 
# == License
# 
# Ekylibre - Simple ERP
# Copyright (C) 2009-2012 Brice Texier, Thibaud Merigon
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see http://www.gnu.org/licenses.
# 
# == Table: asset_depreciations
#
#  accountable       :boolean          not null
#  accounted_at      :datetime         
#  amount            :decimal(19, 4)   not null
#  asset_id          :integer          not null
#  company_id        :integer          not null
#  created_at        :datetime         not null
#  created_on        :date             not null
#  creator_id        :integer          
#  depreciation      :text             
#  financial_year_id :integer          
#  id                :integer          not null, primary key
#  journal_entry_id  :integer          
#  lock_version      :integer          default(0), not null
#  position          :integer          
#  protected         :boolean          not null
#  started_on        :date             not null
#  stopped_on        :date             not null
#  updated_at        :datetime         not null
#  updater_id        :integer          
#
class AssetDepreciation < CompanyRecord
  acts_as_list :scope => :asset_id
  belongs_to :asset
  belongs_to :financial_year
  belongs_to :journal_entry
  #[VALIDATORS[ Do not edit these lines directly. Use `rake clean:validations`.
  validates_numericality_of :amount, :allow_nil => true
  validates_inclusion_of :accountable, :protected, :in => [true, false]
  validates_presence_of :amount, :asset, :company, :created_on, :started_on, :stopped_on
  #]VALIDATORS]
  delegate :currency, :to => :asset

  sums :asset, :depreciations, :amount => :depreciated_amount

  bookkeep(:on => :nothing) do |b|
    b.journal_entry do |entry|
      
    end
  end

  before_validation(:on => :create) do
    self.created_on = Date.today
    self.company = self.asset.company if self.asset
  end

  validate do
    # A depreciation must be on one financial year!
    
    
    # A start day must be the depreciation start or a financial year start
    # Very difficult for future years...
    
  end
  

end
