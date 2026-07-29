# Explore: explore_0800
# Auto-generated LookML Explore File

include: "/views/domain_01/view_02401.view.lkml"
include: "/views/domain_03/view_02403.view.lkml"
include: "/views/domain_04/view_02404.view.lkml"
include: "/views/domain_05/view_02405.view.lkml"

explore: explore_0800 {
  label: "Explore Explore 0800"
  description: "Comprehensive analytics explore joining base view_02401 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02401
  
  always_filter: {
    filters: [view_02401.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02401.created_at_date: "7 days"]
    unless: [view_02401.id, view_02401.status]
  }

  join: view_02403 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02401.user_id} = ${view_02403.id} ;;
    required_joins: []
  }

  join: view_02404 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02401.account_id} = ${view_02404.account_id} ;;
    required_joins: [view_02403]
  }

  join: view_02405 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02401.category} = ${view_02405.category} ;;
  }

  access_filter: {
    field: view_02401.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02401.is_deleted} = false ;;
}
