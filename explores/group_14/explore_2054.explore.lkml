# Explore: explore_2054
# Auto-generated LookML Explore File

include: "/views/domain_13/view_06163.view.lkml"
include: "/views/domain_15/view_06165.view.lkml"
include: "/views/domain_16/view_06166.view.lkml"
include: "/views/domain_17/view_06167.view.lkml"

explore: explore_2054 {
  label: "Explore Explore 2054"
  description: "Comprehensive analytics explore joining base view_06163 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_06163
  
  always_filter: {
    filters: [view_06163.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06163.created_at_date: "7 days"]
    unless: [view_06163.id, view_06163.status]
  }

  join: view_06165 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06163.user_id} = ${view_06165.id} ;;
    required_joins: []
  }

  join: view_06166 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06163.account_id} = ${view_06166.account_id} ;;
    required_joins: [view_06165]
  }

  join: view_06167 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06163.category} = ${view_06167.category} ;;
  }

  access_filter: {
    field: view_06163.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06163.is_deleted} = false ;;
}
