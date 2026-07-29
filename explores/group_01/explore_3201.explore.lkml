# Explore: explore_3201
# Auto-generated LookML Explore File

include: "/views/domain_04/view_09604.view.lkml"
include: "/views/domain_06/view_09606.view.lkml"
include: "/views/domain_07/view_09607.view.lkml"
include: "/views/domain_08/view_09608.view.lkml"

explore: explore_3201 {
  label: "Explore Explore 3201"
  description: "Comprehensive analytics explore joining base view_09604 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09604
  
  always_filter: {
    filters: [view_09604.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09604.created_at_date: "7 days"]
    unless: [view_09604.id, view_09604.status]
  }

  join: view_09606 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09604.user_id} = ${view_09606.id} ;;
    required_joins: []
  }

  join: view_09607 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09604.account_id} = ${view_09607.account_id} ;;
    required_joins: [view_09606]
  }

  join: view_09608 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09604.category} = ${view_09608.category} ;;
  }

  access_filter: {
    field: view_09604.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09604.is_deleted} = false ;;
}
