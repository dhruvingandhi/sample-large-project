# Explore: explore_1465
# Auto-generated LookML Explore File

include: "/views/domain_46/view_04396.view.lkml"
include: "/views/domain_48/view_04398.view.lkml"
include: "/views/domain_49/view_04399.view.lkml"
include: "/views/domain_50/view_04400.view.lkml"

explore: explore_1465 {
  label: "Explore Explore 1465"
  description: "Comprehensive analytics explore joining base view_04396 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04396
  
  always_filter: {
    filters: [view_04396.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04396.created_at_date: "7 days"]
    unless: [view_04396.id, view_04396.status]
  }

  join: view_04398 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04396.user_id} = ${view_04398.id} ;;
    required_joins: []
  }

  join: view_04399 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04396.account_id} = ${view_04399.account_id} ;;
    required_joins: [view_04398]
  }

  join: view_04400 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04396.category} = ${view_04400.category} ;;
  }

  access_filter: {
    field: view_04396.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04396.is_deleted} = false ;;
}
