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


class Animal < CompanyRecord
  belongs_to :group, :class_name => "AnimalGroup"
  #[VALIDATORS[ Do not edit these lines directly. Use `rake clean:validations`.
  validates_length_of :sex, :allow_nil => true, :maximum => 1
  validates_length_of :identification_number, :name, :allow_nil => true, :maximum => 255
  validates_presence_of :born_on, :group, :identification_number, :income_on, :name, :outgone_on, :purchased_on, :sex
  #]VALIDATORS]
  validates_uniqueness_of :name, :identification_number
end
