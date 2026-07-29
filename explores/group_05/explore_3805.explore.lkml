# Explore: explore_3805
# Auto-generated LookML Explore File

include: "/views/domain_16/view_11416.view.lkml"
include: "/views/domain_18/view_11418.view.lkml"
include: "/views/domain_19/view_11419.view.lkml"
include: "/views/domain_20/view_11420.view.lkml"

explore: explore_3805 {
  label: "Explore Explore 3805"
  description: "Comprehensive analytics explore joining base view_11416 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11416
  
  always_filter: {
    filters: [view_11416.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11416.created_at_date: "7 days"]
    unless: [view_11416.id, view_11416.status]
  }

  join: view_11418 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11416.user_id} = ${view_11418.id} ;;
    required_joins: []
  }

  join: view_11419 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11416.account_id} = ${view_11419.account_id} ;;
    required_joins: [view_11418]
  }

  join: view_11420 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11416.category} = ${view_11420.category} ;;
  }

  access_filter: {
    field: view_11416.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11416.is_deleted} = false ;;
}
