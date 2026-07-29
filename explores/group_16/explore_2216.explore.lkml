# Explore: explore_2216
# Auto-generated LookML Explore File

include: "/views/domain_49/view_06649.view.lkml"
include: "/views/domain_01/view_06651.view.lkml"
include: "/views/domain_02/view_06652.view.lkml"
include: "/views/domain_03/view_06653.view.lkml"

explore: explore_2216 {
  label: "Explore Explore 2216"
  description: "Comprehensive analytics explore joining base view_06649 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06649
  
  always_filter: {
    filters: [view_06649.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06649.created_at_date: "7 days"]
    unless: [view_06649.id, view_06649.status]
  }

  join: view_06651 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06649.user_id} = ${view_06651.id} ;;
    required_joins: []
  }

  join: view_06652 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06649.account_id} = ${view_06652.account_id} ;;
    required_joins: [view_06651]
  }

  join: view_06653 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06649.category} = ${view_06653.category} ;;
  }

  access_filter: {
    field: view_06649.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06649.is_deleted} = false ;;
}
