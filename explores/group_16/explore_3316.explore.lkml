# Explore: explore_3316
# Auto-generated LookML Explore File

include: "/views/domain_49/view_09949.view.lkml"
include: "/views/domain_01/view_09951.view.lkml"
include: "/views/domain_02/view_09952.view.lkml"
include: "/views/domain_03/view_09953.view.lkml"

explore: explore_3316 {
  label: "Explore Explore 3316"
  description: "Comprehensive analytics explore joining base view_09949 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09949
  
  always_filter: {
    filters: [view_09949.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09949.created_at_date: "7 days"]
    unless: [view_09949.id, view_09949.status]
  }

  join: view_09951 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09949.user_id} = ${view_09951.id} ;;
    required_joins: []
  }

  join: view_09952 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09949.account_id} = ${view_09952.account_id} ;;
    required_joins: [view_09951]
  }

  join: view_09953 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09949.category} = ${view_09953.category} ;;
  }

  access_filter: {
    field: view_09949.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09949.is_deleted} = false ;;
}
