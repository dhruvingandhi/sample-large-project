# Explore: explore_1568
# Auto-generated LookML Explore File

include: "/views/domain_05/view_04705.view.lkml"
include: "/views/domain_07/view_04707.view.lkml"
include: "/views/domain_08/view_04708.view.lkml"
include: "/views/domain_09/view_04709.view.lkml"

explore: explore_1568 {
  label: "Explore Explore 1568"
  description: "Comprehensive analytics explore joining base view_04705 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04705
  
  always_filter: {
    filters: [view_04705.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04705.created_at_date: "7 days"]
    unless: [view_04705.id, view_04705.status]
  }

  join: view_04707 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04705.user_id} = ${view_04707.id} ;;
    required_joins: []
  }

  join: view_04708 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04705.account_id} = ${view_04708.account_id} ;;
    required_joins: [view_04707]
  }

  join: view_04709 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04705.category} = ${view_04709.category} ;;
  }

  access_filter: {
    field: view_04705.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04705.is_deleted} = false ;;
}
