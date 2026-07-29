# Explore: explore_3763
# Auto-generated LookML Explore File

include: "/views/domain_40/view_11290.view.lkml"
include: "/views/domain_42/view_11292.view.lkml"
include: "/views/domain_43/view_11293.view.lkml"
include: "/views/domain_44/view_11294.view.lkml"

explore: explore_3763 {
  label: "Explore Explore 3763"
  description: "Comprehensive analytics explore joining base view_11290 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11290
  
  always_filter: {
    filters: [view_11290.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11290.created_at_date: "7 days"]
    unless: [view_11290.id, view_11290.status]
  }

  join: view_11292 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11290.user_id} = ${view_11292.id} ;;
    required_joins: []
  }

  join: view_11293 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11290.account_id} = ${view_11293.account_id} ;;
    required_joins: [view_11292]
  }

  join: view_11294 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11290.category} = ${view_11294.category} ;;
  }

  access_filter: {
    field: view_11290.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11290.is_deleted} = false ;;
}
