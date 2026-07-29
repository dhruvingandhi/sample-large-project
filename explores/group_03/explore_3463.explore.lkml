# Explore: explore_3463
# Auto-generated LookML Explore File

include: "/views/domain_40/view_10390.view.lkml"
include: "/views/domain_42/view_10392.view.lkml"
include: "/views/domain_43/view_10393.view.lkml"
include: "/views/domain_44/view_10394.view.lkml"

explore: explore_3463 {
  label: "Explore Explore 3463"
  description: "Comprehensive analytics explore joining base view_10390 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10390
  
  always_filter: {
    filters: [view_10390.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10390.created_at_date: "7 days"]
    unless: [view_10390.id, view_10390.status]
  }

  join: view_10392 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10390.user_id} = ${view_10392.id} ;;
    required_joins: []
  }

  join: view_10393 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10390.account_id} = ${view_10393.account_id} ;;
    required_joins: [view_10392]
  }

  join: view_10394 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10390.category} = ${view_10394.category} ;;
  }

  access_filter: {
    field: view_10390.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10390.is_deleted} = false ;;
}
