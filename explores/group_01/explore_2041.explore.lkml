# Explore: explore_2041
# Auto-generated LookML Explore File

include: "/views/domain_24/view_06124.view.lkml"
include: "/views/domain_26/view_06126.view.lkml"
include: "/views/domain_27/view_06127.view.lkml"
include: "/views/domain_28/view_06128.view.lkml"

explore: explore_2041 {
  label: "Explore Explore 2041"
  description: "Comprehensive analytics explore joining base view_06124 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06124
  
  always_filter: {
    filters: [view_06124.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06124.created_at_date: "7 days"]
    unless: [view_06124.id, view_06124.status]
  }

  join: view_06126 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06124.user_id} = ${view_06126.id} ;;
    required_joins: []
  }

  join: view_06127 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06124.account_id} = ${view_06127.account_id} ;;
    required_joins: [view_06126]
  }

  join: view_06128 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06124.category} = ${view_06128.category} ;;
  }

  access_filter: {
    field: view_06124.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06124.is_deleted} = false ;;
}
