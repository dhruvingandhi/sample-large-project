# Update for 2000 file diff target
# Explore: explore_1820
# Auto-generated LookML Explore File

include: "/views/domain_11/view_05461.view.lkml"
include: "/views/domain_13/view_05463.view.lkml"
include: "/views/domain_14/view_05464.view.lkml"
include: "/views/domain_15/view_05465.view.lkml"

explore: explore_1820 {
  label: "Explore Explore 1820"
  description: "Comprehensive analytics explore joining base view_05461 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05461
  
  always_filter: {
    filters: [view_05461.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05461.created_at_date: "7 days"]
    unless: [view_05461.id, view_05461.status]
  }

  join: view_05463 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05461.user_id} = ${view_05463.id} ;;
    required_joins: []
  }

  join: view_05464 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05461.account_id} = ${view_05464.account_id} ;;
    required_joins: [view_05463]
  }

  join: view_05465 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05461.category} = ${view_05465.category} ;;
  }

  access_filter: {
    field: view_05461.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05461.is_deleted} = false ;;
}
