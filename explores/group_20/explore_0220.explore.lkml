# Explore: explore_0220
# Auto-generated LookML Explore File

include: "/views/domain_11/view_00661.view.lkml"
include: "/views/domain_13/view_00663.view.lkml"
include: "/views/domain_14/view_00664.view.lkml"
include: "/views/domain_15/view_00665.view.lkml"

explore: explore_0220 {
  label: "Explore Explore 0220"
  description: "Comprehensive analytics explore joining base view_00661 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00661
  
  always_filter: {
    filters: [view_00661.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00661.created_at_date: "7 days"]
    unless: [view_00661.id, view_00661.status]
  }

  join: view_00663 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00661.user_id} = ${view_00663.id} ;;
    required_joins: []
  }

  join: view_00664 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00661.account_id} = ${view_00664.account_id} ;;
    required_joins: [view_00663]
  }

  join: view_00665 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00661.category} = ${view_00665.category} ;;
  }

  access_filter: {
    field: view_00661.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00661.is_deleted} = false ;;
}
