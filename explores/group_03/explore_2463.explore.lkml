# Explore: explore_2463
# Auto-generated LookML Explore File

include: "/views/domain_40/view_07390.view.lkml"
include: "/views/domain_42/view_07392.view.lkml"
include: "/views/domain_43/view_07393.view.lkml"
include: "/views/domain_44/view_07394.view.lkml"

explore: explore_2463 {
  label: "Explore Explore 2463"
  description: "Comprehensive analytics explore joining base view_07390 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_07390
  
  always_filter: {
    filters: [view_07390.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07390.created_at_date: "7 days"]
    unless: [view_07390.id, view_07390.status]
  }

  join: view_07392 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07390.user_id} = ${view_07392.id} ;;
    required_joins: []
  }

  join: view_07393 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07390.account_id} = ${view_07393.account_id} ;;
    required_joins: [view_07392]
  }

  join: view_07394 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07390.category} = ${view_07394.category} ;;
  }

  access_filter: {
    field: view_07390.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07390.is_deleted} = false ;;
}
