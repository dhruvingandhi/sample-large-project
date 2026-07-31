# Update for 2000 file diff target
# Explore: explore_2919
# Auto-generated LookML Explore File

include: "/views/domain_08/view_08758.view.lkml"
include: "/views/domain_10/view_08760.view.lkml"
include: "/views/domain_11/view_08761.view.lkml"
include: "/views/domain_12/view_08762.view.lkml"

explore: explore_2919 {
  label: "Explore Explore 2919"
  description: "Comprehensive analytics explore joining base view_08758 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08758
  
  always_filter: {
    filters: [view_08758.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08758.created_at_date: "7 days"]
    unless: [view_08758.id, view_08758.status]
  }

  join: view_08760 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08758.user_id} = ${view_08760.id} ;;
    required_joins: []
  }

  join: view_08761 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08758.account_id} = ${view_08761.account_id} ;;
    required_joins: [view_08760]
  }

  join: view_08762 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08758.category} = ${view_08762.category} ;;
  }

  access_filter: {
    field: view_08758.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08758.is_deleted} = false ;;
}
