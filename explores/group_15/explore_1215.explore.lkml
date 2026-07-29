# Explore: explore_1215
# Auto-generated LookML Explore File

include: "/views/domain_46/view_03646.view.lkml"
include: "/views/domain_48/view_03648.view.lkml"
include: "/views/domain_49/view_03649.view.lkml"
include: "/views/domain_50/view_03650.view.lkml"

explore: explore_1215 {
  label: "Explore Explore 1215"
  description: "Comprehensive analytics explore joining base view_03646 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03646
  
  always_filter: {
    filters: [view_03646.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03646.created_at_date: "7 days"]
    unless: [view_03646.id, view_03646.status]
  }

  join: view_03648 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03646.user_id} = ${view_03648.id} ;;
    required_joins: []
  }

  join: view_03649 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03646.account_id} = ${view_03649.account_id} ;;
    required_joins: [view_03648]
  }

  join: view_03650 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03646.category} = ${view_03650.category} ;;
  }

  access_filter: {
    field: view_03646.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03646.is_deleted} = false ;;
}
