# Update for 2000 file diff target
# Explore: explore_0904
# Auto-generated LookML Explore File

include: "/views/domain_13/view_02713.view.lkml"
include: "/views/domain_15/view_02715.view.lkml"
include: "/views/domain_16/view_02716.view.lkml"
include: "/views/domain_17/view_02717.view.lkml"

explore: explore_0904 {
  label: "Explore Explore 0904"
  description: "Comprehensive analytics explore joining base view_02713 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02713
  
  always_filter: {
    filters: [view_02713.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02713.created_at_date: "7 days"]
    unless: [view_02713.id, view_02713.status]
  }

  join: view_02715 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02713.user_id} = ${view_02715.id} ;;
    required_joins: []
  }

  join: view_02716 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02713.account_id} = ${view_02716.account_id} ;;
    required_joins: [view_02715]
  }

  join: view_02717 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02713.category} = ${view_02717.category} ;;
  }

  access_filter: {
    field: view_02713.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02713.is_deleted} = false ;;
}
