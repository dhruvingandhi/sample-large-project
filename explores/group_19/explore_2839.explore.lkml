# Update for 2000 file diff target
# Explore: explore_2839
# Auto-generated LookML Explore File

include: "/views/domain_18/view_08518.view.lkml"
include: "/views/domain_20/view_08520.view.lkml"
include: "/views/domain_21/view_08521.view.lkml"
include: "/views/domain_22/view_08522.view.lkml"

explore: explore_2839 {
  label: "Explore Explore 2839"
  description: "Comprehensive analytics explore joining base view_08518 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08518
  
  always_filter: {
    filters: [view_08518.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08518.created_at_date: "7 days"]
    unless: [view_08518.id, view_08518.status]
  }

  join: view_08520 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08518.user_id} = ${view_08520.id} ;;
    required_joins: []
  }

  join: view_08521 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08518.account_id} = ${view_08521.account_id} ;;
    required_joins: [view_08520]
  }

  join: view_08522 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08518.category} = ${view_08522.category} ;;
  }

  access_filter: {
    field: view_08518.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08518.is_deleted} = false ;;
}
