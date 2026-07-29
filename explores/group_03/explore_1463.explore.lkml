# Explore: explore_1463
# Auto-generated LookML Explore File

include: "/views/domain_40/view_04390.view.lkml"
include: "/views/domain_42/view_04392.view.lkml"
include: "/views/domain_43/view_04393.view.lkml"
include: "/views/domain_44/view_04394.view.lkml"

explore: explore_1463 {
  label: "Explore Explore 1463"
  description: "Comprehensive analytics explore joining base view_04390 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04390
  
  always_filter: {
    filters: [view_04390.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04390.created_at_date: "7 days"]
    unless: [view_04390.id, view_04390.status]
  }

  join: view_04392 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04390.user_id} = ${view_04392.id} ;;
    required_joins: []
  }

  join: view_04393 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04390.account_id} = ${view_04393.account_id} ;;
    required_joins: [view_04392]
  }

  join: view_04394 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04390.category} = ${view_04394.category} ;;
  }

  access_filter: {
    field: view_04390.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04390.is_deleted} = false ;;
}
