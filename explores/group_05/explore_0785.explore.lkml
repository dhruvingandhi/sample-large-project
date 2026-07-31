# Antigravity modified: branch dg-3
# Explore: explore_0785
# Auto-generated LookML Explore File

include: "/views/domain_06/view_02356.view.lkml"
include: "/views/domain_08/view_02358.view.lkml"
include: "/views/domain_09/view_02359.view.lkml"
include: "/views/domain_10/view_02360.view.lkml"

explore: explore_0785 {
  label: "Explore Explore 0785"
  description: "Comprehensive analytics explore joining base view_02356 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02356
  
  always_filter: {
    filters: [view_02356.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02356.created_at_date: "7 days"]
    unless: [view_02356.id, view_02356.status]
  }

  join: view_02358 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02356.user_id} = ${view_02358.id} ;;
    required_joins: []
  }

  join: view_02359 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02356.account_id} = ${view_02359.account_id} ;;
    required_joins: [view_02358]
  }

  join: view_02360 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02356.category} = ${view_02360.category} ;;
  }

  access_filter: {
    field: view_02356.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02356.is_deleted} = false ;;
}
