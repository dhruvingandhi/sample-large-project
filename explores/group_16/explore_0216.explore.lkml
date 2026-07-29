# Explore: explore_0216
# Auto-generated LookML Explore File

include: "/views/domain_49/view_00649.view.lkml"
include: "/views/domain_01/view_00651.view.lkml"
include: "/views/domain_02/view_00652.view.lkml"
include: "/views/domain_03/view_00653.view.lkml"

explore: explore_0216 {
  label: "Explore Explore 0216"
  description: "Comprehensive analytics explore joining base view_00649 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00649
  
  always_filter: {
    filters: [view_00649.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00649.created_at_date: "7 days"]
    unless: [view_00649.id, view_00649.status]
  }

  join: view_00651 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00649.user_id} = ${view_00651.id} ;;
    required_joins: []
  }

  join: view_00652 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00649.account_id} = ${view_00652.account_id} ;;
    required_joins: [view_00651]
  }

  join: view_00653 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00649.category} = ${view_00653.category} ;;
  }

  access_filter: {
    field: view_00649.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00649.is_deleted} = false ;;
}
