# Explore: explore_2820
# Auto-generated LookML Explore File

include: "/views/domain_11/view_08461.view.lkml"
include: "/views/domain_13/view_08463.view.lkml"
include: "/views/domain_14/view_08464.view.lkml"
include: "/views/domain_15/view_08465.view.lkml"

explore: explore_2820 {
  label: "Explore Explore 2820"
  description: "Comprehensive analytics explore joining base view_08461 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08461
  
  always_filter: {
    filters: [view_08461.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08461.created_at_date: "7 days"]
    unless: [view_08461.id, view_08461.status]
  }

  join: view_08463 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08461.user_id} = ${view_08463.id} ;;
    required_joins: []
  }

  join: view_08464 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08461.account_id} = ${view_08464.account_id} ;;
    required_joins: [view_08463]
  }

  join: view_08465 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08461.category} = ${view_08465.category} ;;
  }

  access_filter: {
    field: view_08461.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08461.is_deleted} = false ;;
}
