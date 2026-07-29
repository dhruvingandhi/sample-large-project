# Explore: explore_2103
# Auto-generated LookML Explore File

include: "/views/domain_10/view_06310.view.lkml"
include: "/views/domain_12/view_06312.view.lkml"
include: "/views/domain_13/view_06313.view.lkml"
include: "/views/domain_14/view_06314.view.lkml"

explore: explore_2103 {
  label: "Explore Explore 2103"
  description: "Comprehensive analytics explore joining base view_06310 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06310
  
  always_filter: {
    filters: [view_06310.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06310.created_at_date: "7 days"]
    unless: [view_06310.id, view_06310.status]
  }

  join: view_06312 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06310.user_id} = ${view_06312.id} ;;
    required_joins: []
  }

  join: view_06313 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06310.account_id} = ${view_06313.account_id} ;;
    required_joins: [view_06312]
  }

  join: view_06314 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06310.category} = ${view_06314.category} ;;
  }

  access_filter: {
    field: view_06310.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06310.is_deleted} = false ;;
}
