# Explore: explore_2316
# Auto-generated LookML Explore File

include: "/views/domain_49/view_06949.view.lkml"
include: "/views/domain_01/view_06951.view.lkml"
include: "/views/domain_02/view_06952.view.lkml"
include: "/views/domain_03/view_06953.view.lkml"

explore: explore_2316 {
  label: "Explore Explore 2316"
  description: "Comprehensive analytics explore joining base view_06949 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06949
  
  always_filter: {
    filters: [view_06949.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06949.created_at_date: "7 days"]
    unless: [view_06949.id, view_06949.status]
  }

  join: view_06951 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06949.user_id} = ${view_06951.id} ;;
    required_joins: []
  }

  join: view_06952 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06949.account_id} = ${view_06952.account_id} ;;
    required_joins: [view_06951]
  }

  join: view_06953 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06949.category} = ${view_06953.category} ;;
  }

  access_filter: {
    field: view_06949.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06949.is_deleted} = false ;;
}
