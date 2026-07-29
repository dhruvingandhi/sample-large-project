# Explore: explore_0215
# Auto-generated LookML Explore File

include: "/views/domain_46/view_00646.view.lkml"
include: "/views/domain_48/view_00648.view.lkml"
include: "/views/domain_49/view_00649.view.lkml"
include: "/views/domain_50/view_00650.view.lkml"

explore: explore_0215 {
  label: "Explore Explore 0215"
  description: "Comprehensive analytics explore joining base view_00646 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00646
  
  always_filter: {
    filters: [view_00646.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00646.created_at_date: "7 days"]
    unless: [view_00646.id, view_00646.status]
  }

  join: view_00648 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00646.user_id} = ${view_00648.id} ;;
    required_joins: []
  }

  join: view_00649 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00646.account_id} = ${view_00649.account_id} ;;
    required_joins: [view_00648]
  }

  join: view_00650 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00646.category} = ${view_00650.category} ;;
  }

  access_filter: {
    field: view_00646.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00646.is_deleted} = false ;;
}
