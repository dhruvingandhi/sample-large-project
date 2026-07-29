# Explore: explore_3415
# Auto-generated LookML Explore File

include: "/views/domain_46/view_10246.view.lkml"
include: "/views/domain_48/view_10248.view.lkml"
include: "/views/domain_49/view_10249.view.lkml"
include: "/views/domain_50/view_10250.view.lkml"

explore: explore_3415 {
  label: "Explore Explore 3415"
  description: "Comprehensive analytics explore joining base view_10246 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10246
  
  always_filter: {
    filters: [view_10246.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10246.created_at_date: "7 days"]
    unless: [view_10246.id, view_10246.status]
  }

  join: view_10248 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10246.user_id} = ${view_10248.id} ;;
    required_joins: []
  }

  join: view_10249 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10246.account_id} = ${view_10249.account_id} ;;
    required_joins: [view_10248]
  }

  join: view_10250 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10246.category} = ${view_10250.category} ;;
  }

  access_filter: {
    field: view_10246.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10246.is_deleted} = false ;;
}
