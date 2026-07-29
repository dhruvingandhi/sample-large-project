# Explore: explore_2495
# Auto-generated LookML Explore File

include: "/views/domain_36/view_07486.view.lkml"
include: "/views/domain_38/view_07488.view.lkml"
include: "/views/domain_39/view_07489.view.lkml"
include: "/views/domain_40/view_07490.view.lkml"

explore: explore_2495 {
  label: "Explore Explore 2495"
  description: "Comprehensive analytics explore joining base view_07486 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07486
  
  always_filter: {
    filters: [view_07486.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07486.created_at_date: "7 days"]
    unless: [view_07486.id, view_07486.status]
  }

  join: view_07488 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07486.user_id} = ${view_07488.id} ;;
    required_joins: []
  }

  join: view_07489 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07486.account_id} = ${view_07489.account_id} ;;
    required_joins: [view_07488]
  }

  join: view_07490 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07486.category} = ${view_07490.category} ;;
  }

  access_filter: {
    field: view_07486.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07486.is_deleted} = false ;;
}
