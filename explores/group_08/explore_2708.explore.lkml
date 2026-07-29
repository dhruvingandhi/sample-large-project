# Explore: explore_2708
# Auto-generated LookML Explore File

include: "/views/domain_25/view_08125.view.lkml"
include: "/views/domain_27/view_08127.view.lkml"
include: "/views/domain_28/view_08128.view.lkml"
include: "/views/domain_29/view_08129.view.lkml"

explore: explore_2708 {
  label: "Explore Explore 2708"
  description: "Comprehensive analytics explore joining base view_08125 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08125
  
  always_filter: {
    filters: [view_08125.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08125.created_at_date: "7 days"]
    unless: [view_08125.id, view_08125.status]
  }

  join: view_08127 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08125.user_id} = ${view_08127.id} ;;
    required_joins: []
  }

  join: view_08128 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08125.account_id} = ${view_08128.account_id} ;;
    required_joins: [view_08127]
  }

  join: view_08129 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08125.category} = ${view_08129.category} ;;
  }

  access_filter: {
    field: view_08125.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08125.is_deleted} = false ;;
}
