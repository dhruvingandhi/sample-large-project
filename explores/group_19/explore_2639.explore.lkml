# Update for 2000 file diff target
# Explore: explore_2639
# Auto-generated LookML Explore File

include: "/views/domain_18/view_07918.view.lkml"
include: "/views/domain_20/view_07920.view.lkml"
include: "/views/domain_21/view_07921.view.lkml"
include: "/views/domain_22/view_07922.view.lkml"

explore: explore_2639 {
  label: "Explore Explore 2639"
  description: "Comprehensive analytics explore joining base view_07918 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07918
  
  always_filter: {
    filters: [view_07918.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07918.created_at_date: "7 days"]
    unless: [view_07918.id, view_07918.status]
  }

  join: view_07920 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07918.user_id} = ${view_07920.id} ;;
    required_joins: []
  }

  join: view_07921 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07918.account_id} = ${view_07921.account_id} ;;
    required_joins: [view_07920]
  }

  join: view_07922 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07918.category} = ${view_07922.category} ;;
  }

  access_filter: {
    field: view_07918.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07918.is_deleted} = false ;;
}
