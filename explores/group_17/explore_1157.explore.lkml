# Update for 2000 file diff target
# Explore: explore_1157
# Auto-generated LookML Explore File

include: "/views/domain_22/view_03472.view.lkml"
include: "/views/domain_24/view_03474.view.lkml"
include: "/views/domain_25/view_03475.view.lkml"
include: "/views/domain_26/view_03476.view.lkml"

explore: explore_1157 {
  label: "Explore Explore 1157"
  description: "Comprehensive analytics explore joining base view_03472 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03472
  
  always_filter: {
    filters: [view_03472.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03472.created_at_date: "7 days"]
    unless: [view_03472.id, view_03472.status]
  }

  join: view_03474 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03472.user_id} = ${view_03474.id} ;;
    required_joins: []
  }

  join: view_03475 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03472.account_id} = ${view_03475.account_id} ;;
    required_joins: [view_03474]
  }

  join: view_03476 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03472.category} = ${view_03476.category} ;;
  }

  access_filter: {
    field: view_03472.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03472.is_deleted} = false ;;
}
