# Explore: explore_0463
# Auto-generated LookML Explore File

include: "/views/domain_40/view_01390.view.lkml"
include: "/views/domain_42/view_01392.view.lkml"
include: "/views/domain_43/view_01393.view.lkml"
include: "/views/domain_44/view_01394.view.lkml"

explore: explore_0463 {
  label: "Explore Explore 0463"
  description: "Comprehensive analytics explore joining base view_01390 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01390
  
  always_filter: {
    filters: [view_01390.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01390.created_at_date: "7 days"]
    unless: [view_01390.id, view_01390.status]
  }

  join: view_01392 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01390.user_id} = ${view_01392.id} ;;
    required_joins: []
  }

  join: view_01393 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01390.account_id} = ${view_01393.account_id} ;;
    required_joins: [view_01392]
  }

  join: view_01394 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01390.category} = ${view_01394.category} ;;
  }

  access_filter: {
    field: view_01390.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01390.is_deleted} = false ;;
}
