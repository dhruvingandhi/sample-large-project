# Explore: explore_2993
# Auto-generated LookML Explore File

include: "/views/domain_30/view_08980.view.lkml"
include: "/views/domain_32/view_08982.view.lkml"
include: "/views/domain_33/view_08983.view.lkml"
include: "/views/domain_34/view_08984.view.lkml"

explore: explore_2993 {
  label: "Explore Explore 2993"
  description: "Comprehensive analytics explore joining base view_08980 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08980
  
  always_filter: {
    filters: [view_08980.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08980.created_at_date: "7 days"]
    unless: [view_08980.id, view_08980.status]
  }

  join: view_08982 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08980.user_id} = ${view_08982.id} ;;
    required_joins: []
  }

  join: view_08983 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08980.account_id} = ${view_08983.account_id} ;;
    required_joins: [view_08982]
  }

  join: view_08984 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08980.category} = ${view_08984.category} ;;
  }

  access_filter: {
    field: view_08980.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08980.is_deleted} = false ;;
}
